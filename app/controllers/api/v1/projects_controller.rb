module Api
  module V1
    class ProjectsController < Api::ApplicationController
      def index
        @projects = Project.includes(:tasks)
                           .order(params[:sort])
                           .page(params[:page])
                           .per(3)

        serializable_projects = ActiveModelSerializers::SerializableResource.new(
          @projects, each_serializer: ProjectSerializer
        )
        render json: { projects: serializable_projects }
      end
      def create
        @project = create_project.project
        if create_project.success?
          render json: { project: @project, message: "Project Created using JSON" }
        else
          render json: { project: {}, errors: @project.errors }
        end
      end

      private

      def create_project
        @create_project ||=
          Projects::Create.call(project_params: project_params, user: current_user)
      end

      def project_params
        params.require(:project).permit(:name, :description)
      end
    end
  end
end
