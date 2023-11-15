module Api
  module V1

    class TasksController < Api::ApplicationController
      before_action :set_project
      before_action :set_task, only: %i[destroy update]

      def index
        @tasks = @project.tasks
                         .order(params[:sort]).page(params[:page]).per(3)

        serializable_tasks = ActiveModelSerializers::SerializableResource.new(
        @tasks, each_serializer: TaskSerializer
        )
        render json: { tasks: serializable_tasks }
      end

      def create
        @task = create_task.task
        if create_task.success?
          render json: { task: @task, message: "Task has been Created using JSON" }
        else
          render json: { task: {}, errors: @task.errors }
        end
      end

      def update
        @task = update_task.task
        if update_task.success?
          render json: { task: @task, message: "Task has been Updated using JSON" }
        else
          render json: { task: {}, errors: @task.errors }
        end
      end

      def destroy
        @task = destroy_task.task
        if destroy_task.success?
          render json: { task: @task, message: "Task has been Deleted using JSON" }
        else
          render json: { task: {}, errors: @task.errors }
        end
      end

      private

      def set_project
        @project = Project.find_by(id: params[:project_id])
      end

      def set_task
        @task = @project.tasks.find(params[:id])
      end

      def create_task
        @create_task ||= ::Tasks::Create.call(task_params: task_params, project: @project)
      end

      def update_task
        @update_task ||= ::Tasks::Update.call(task_params: task_params, task: @task)
      end

      def destroy_task
        @destroy_task ||= ::Tasks::Destroy.call(task: @task, user: current_user)
      end

      def task_params
        params.require(:task).permit(:name, :description, :status, :deadline_at)
      end
    end
  end
end