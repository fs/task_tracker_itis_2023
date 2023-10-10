class TasksController < ApplicationController
  before_action :set_project, only: %i[index new create edit update destroy]
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @project.tasks = Task.includes(:project)
  end

  def show; end

  def edit; end

  def update
  
    if @task.update(task_params)
     redirect_to project_tasks_path(@project), notice: "Update Successful"
    else
      render :edit, status: :unprocessable_entity
    end
    
  end
  

  def new 
    @task = @project.tasks.new
  end

  def create
    @task = @project.tasks.new(task_params)
    @task.deadline = 7.days.from_now
    if @task.save
      redirect_to project_tasks_path(params[:project_id]), notice: 'Task successfully created.'
    else
      render :new
    end
  end

  def destroy
    @task.destroy
    redirect_to project_tasks_path(@project), notice: "Task destroyed"
  end 
  
  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @task = @project.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :status, :deadline)
  end
end