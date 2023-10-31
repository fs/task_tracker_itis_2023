class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  def index
    @projects = Project.order(params[:sort]).page(params[:page]).per(3)
  end

  def show
    @project = Project.find(params[:id])
    authorize! @project, to: :show
  end


  def new
    @project = Project.new
  end

  def edit
  end
# -----------------------CREATE-------------------------
  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_path, notice: "Gracefully Created"
    else
      render :new, status: :unprocessable_entity
    end
  end

# -----------------------UPDATE------------------
  def update
    @project = Project.find(params[:id])
    updated_attributes = project_params
    result = UpdateProject.call(project: @project, updated_attributes: updated_attributes)

    if result.success?
      redirect_to projects_path, notice: result.message
    else
      redirect_to projects_path(@project), notice: result.message
    end
    # if @project.update(project_params)
    #   redirect_to projects_path, notice: "Gracefully Updated"
    # else
    #   render :edit, status: :unprocessable_entity
    # end
  end

# ----------------DELETE-----------------------
  def destroy
    # @project.destroy
    @project = Project.find(params[:id])
    # @project.assignments.each do |assignment|
    #   assignment.comments.destroy_all
    # end
    # @project.assignments.destroy_all
    # @project.destroy
    # redirect_to projects_path, notice: "Gracefully Deleted"

    result = DeleteProject.call(project: @project)

    if result.success?
      redirect_to projects_path, notice: result.message
    else
      redirect_to projects_path(@project), notice: result.message
    end
  end

  private

  def set_project
    @project = Project.find_by(id: params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
