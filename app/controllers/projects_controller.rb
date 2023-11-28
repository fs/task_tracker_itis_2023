class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]
  before_action -> { authorize! Project }, only: %i[index new create]
  before_action -> { authorize! @project }, only: %i[edit update destroy show]
  def index
    @projects = Project.order(params[:sort]).page(params[:page]).per(3)
  end

  def show
    @tasks = @project.tasks.order(params[:sort]).page(params[:page]).per(3)
  end

  def new
    @project = Project.new
  end

  def edit; end

  def create
    @project = Project.new(project_params)
    @project_membership = ProjectMembership.new(project_membership_params)
    if @project.save && @project_membership.save
      redirect_to projects_path, notice: "Created Successful"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @project.update(project_params)
      redirect_to projects_path, notice: "Update Successful"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: "Project destroyed"
  end

  private

  def set_project
    @project = Project.find_by(id: params[:id])
  end

  def project_membership_params
    { project: @project, user: current_user, role: :owner }
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end