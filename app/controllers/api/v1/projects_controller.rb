module Api
  module V1
    class ProjectsController < Api::ApplicationController
      def index
        @projects = Project.order(params[:sort])
                           .page(params[:page])
                           .per(3)

        render json: { projects: @projects }
      end

      def create
        @project = create_project.project
        if create_project.success?
          render json: { project: @project, message: "Project Created" }
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
