module Api
  module V1
    class ProjectsController < Api::ApplicationController
      before_action :set_project, only: %i[show edit update destroy]
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

      def edit; end

      def create
        @project = create_project.project
        if create_project.success?
          render json: { project: @project, message: "Project Created" }
        else
          render json: { project: {}, errors: @project.errors }
        end
      end

      def update
        if update_project.success?
          render json: { project: @project, message: "Project Updated" }
        else
          render json: { project: {}, errors: @project.errors }
        end
      end

      def destroy
        destroy_project
        if destroy_project.success?
          render json: { project: {}, errors: @project.id, message: "Project Destroyed" }
        else
      end
    end


      private

      def create_project
        @create_project ||=
          Projects::Create.call(project_params: project_params, user: current_user)
      end

      def destroy_project
        ::Projects::Destroy.call(project: @project)
      end

      def update_project
        ::Projects::Update.call(project: @project,
                                project_params: project_params)
      end

      def set_project
        @project = Project.find_by(id: params[:id])
      end

      def project_params
        params.require(:project).permit(:name, :description)
      end
    end
  end
end