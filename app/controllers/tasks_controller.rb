class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all.order(:id)
  end

  def show; end 

  def edit; end 

  def update 
    if @task.update(task_params)
      redirect_to project_path(@project), notice: "Update Successful"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @task = @project.tasks.build
    @task.deadline ||= 1.week.from_now
  end

  def create
    @task = @project.tasks.build(task_params) 

    if @task.save 
      redirect_to project_path(@project), notice: "Created Successful"
    else 
      render :new, status: :unprocessable_entity 
    end
  end

  def destroy 
    @task.destroy 
    redirect_to project_path(@project), notice: "Task destroyed"
  end
  



  private 

  def set_project
    @project = Project.find_by(id: params[:project_id])
  end

  def set_task
    @task = Task.find_by!(id: params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :deadline, :description)
  end
  
end
