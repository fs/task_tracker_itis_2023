class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = @project.tasks.order(params[:sort]).page(params[:page]).per(3)
    authorize! @tasks
  end

  def show
    authorize! @task
  end

  def new
    @task = @project.tasks.build
    authorize! @task
    @task.deadline_at ||= 1.week.from_now
  end

  def edit
    authorize! @task
  end

  def create
    @task = @project.tasks.build(task_params)
    authorize! @task

    if @task.save
      redirect_to project_tasks_path(@project), notice: "Task created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize! @task
    if @task.update(task_params)
      redirect_to project_tasks_path(@project), notice: "Task updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize! @task
    @task.destroy
    redirect_to project_tasks_path(@project), notice: "Task destroyed"
  end

  private

  def set_project
    @project = Project.find_by(id: params[:project_id])
  end

  def set_task
    @task = @project.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :status, :deadline_at)
  end
end
