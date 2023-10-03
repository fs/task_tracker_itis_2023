class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  def index
    @projects = Project.all.order(:id)
  end

  def show; end

  def edit; end

  def update
    puts "Task Params: #{task_params.inspect}" # Debugging statement
  
    if @task.update(task_params)
      redirect_to project_tasks_path(@project), notice: "Update Successful"
    else
      puts "Errors: #{task.errors.full_messages.inspect}" # Debugging statement
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_path, notice: "Created Successful"
    else
      render :new, status: :unprocessable_entity
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

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
