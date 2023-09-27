class TasksController < ApplicationController
  before_action :set_project, only: %i[index new create]
  before_action :set_task, only: %i[show]

  def index
    @tasks = Task.includes(:project) 
  end

  def show; end

  def new 
    @task = @project.tasks.new
  end

  def create
    @task = @progect.tasks.new(task_params)
    if @task.save
      redirect_to task_path(@task), notice: 'Task successfully created.'
    else
      render :new
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @task = Task.find(params[id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :status, :deadline)
  end
end