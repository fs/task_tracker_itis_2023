class TasksController < ApplicationController
  before_action :set_project, only: %i[index new create]
  before_action :set_task, only: %i[show edit update destroy]
  def index
    if params[:project_id]
      @tasks = Task.where(project_id: params[:project_id])
    end
  end

  def show;
  end

  def edit
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end

  def update
    if @task.update(task_params)
      redirect_to project_tasks_path, notice: "Update Successful"
    else
      redirect_to project_tasks_path, notice: "Something went wrong. Try again."
    end
  end

  def new
    @task = @project.tasks.build
    @task.deadline_at ||= 1.week.from_now
  end

  def create
    @task = @project.tasks.build(task_params)

    if @task.save
      redirect_to project_tasks_path, notice: "Created Successful"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to project_tasks_path, notice: "Task destroyed"
  end

  private

  def set_task
    @task = Task.find_by(id: params[:id])
  end

  def set_project
    @project = Project.find_by(id: params[:project_id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :state, :deadline_at)
  end
end
