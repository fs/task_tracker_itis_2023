class TasksController < ApplicationController
  before_action :set_project, only: %i[index new create]
  before_action :set_task, only: %i[show edit update create]

  def index
    @project.tasks = Task.includes(:project)
  end

  def show; end

  def edit; end

  def update
    if @project.task.update(task_params)
      redirect_to projects_tasks_path, notice: "Update Successful"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new 
    @task = @project.tasks.new
  end

  def create
    @task = @project.tasks.new(task_params)
    if @task.save
      redirect_to project_tasks_path(params[:project_id]), notice: 'Task successfully created.'
    else
      render :new
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :status, :deadline)
  end
end