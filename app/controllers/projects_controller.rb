class ProjectsController < ApplicationController
  def index
    #   @projects = Project.all.order("created_at DESC")
    # end
    @projects = Project.order(params[:sort]).page(params[:page]).per(4)
  end

  def new
    @project = Project.new
  end

  def show
    @project = set_project
  end

  def edit
    @project = set_project
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project, notice: "Project has been created!"
    else
      redirect_to projects_path
      flash[:notice] = "An error has occurred! Can't create the project!"
    end

  end

  def update
    @project = set_project
    if @project.update(project_params)
      redirect_to @project, notice: "Project has been updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @project = set_project
    @project.tasks.destroy_all
    @project.destroy
    redirect_to projects_path, notice: "Project has been deleted!"
  end


  private
  def set_project
    @project = Project.find_by(id: params[:id])
  end
  def project_params
    params.require(:project).permit(:name, :description)
  end
end