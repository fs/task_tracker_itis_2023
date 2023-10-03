class ProjectsController <  ApplicationController

    def index
        @projects = Project.all
    end

    def new 
        @project = Project.new
    end

    def create
        @project = Project.new(project_params)
        if(@project.save)
            redirect_to '/'
        end
    end

    def show
    @project = Project.find_by(id: params[:id])
    end

    def destroy
        @project = Project.find(params[:id])
        @project.destroy
        redirect_to '/'
    end

    private

    def project_params
        params.require(:project).permit(:name, :description)
    end


end