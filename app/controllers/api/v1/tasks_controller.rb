module Api
  module V1
    class TasksController < Api::ApplicationController
      def index
        @project = Project.find_by(id: params[:project_id])
        @tasks = @project.tasks.order(params[:sort]).page(params[:page]).per(3)

        serializable_tasks = ActiveModelSerializers::SerializableResource.new(
          @tasks, each_serializer: TaskSerializer
        )
        render json: { tasks: serializable_tasks }
      end

      def project_params
        params.require(:project).permit(:name, :description)
      end

      def set_task
        @task = @project.tasks.find(params[:id])
      end
    end
  end
end
