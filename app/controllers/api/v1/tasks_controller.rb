module Api
  module V1
    class TasksController < Api::ApplicationController
      before_action :set_project
      before_action :set_task, only: %i[update destroy]
      def index
        @tasks = Task.order(params[:sort])
                     .page(params[:page])
                     .per(3)

        serializable_tasks = ActiveModelSerializers::SerializableResource.new(
          @tasks, each_serializer: TaskSerializer
        )
        
        render json: { tasks: serializable_tasks }
      end

      def create
        @task = create_task.task
        serializable_task = ActiveModelSerializers::SerializableResource.new(
          @task, serializer: TaskSerializer
        )
        if create_task.success?
          render json: { task: serializable_task, message: "Task Created" }
        else
          render json: { task: {}, errors: @task.errors }
        end
      end

      def update
        @task = update_task.task
        serializable_task = ActiveModelSerializers::SerializableResource.new(
          @task, serializer: TaskSerializer
        )
        if update_task.success?
          render json: { task: serializable_task, message: "Task Updated" }
        else
          render json: { task: {}, errors: @task.errors }
        end
      end

      def destroy
        destroy_task
        render json: { task: {}, errors: @task.id, message: "Task Destroyed" }
      end

      private

      def create_task
        @create_task ||= ::Tasks::Create.call(task_params: task_params, project: @project)
      end

      def update_task
        ::Tasks::Update.call(task_params: task_params, task: @task)
      end

      def destroy_task
        ::Tasks::Destroy.call(task: @task, user: current_user)
      end

      def set_project
        @project = Project.find_by(id: params[:project_id])
      end

      def set_task
        @task = @project.tasks.find(params[:id])
      end
      
      def task_params
        params.require(:task).permit(:name, :description, :status, :deadline_at)
      end
    end
  end
end