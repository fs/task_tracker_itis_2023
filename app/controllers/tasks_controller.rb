class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = @project.tasks
  end

  def show; end

  def new
    @task = @project.tasks.build
    @task.deadline_at ||= 1.week.from_now
  end

  def edit; end

  def create
    @task = @project.tasks.build(task_params)

    if @task.save
      redirect_to project_tasks_path(@project), notice: "Task created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      redirect_to project_tasks_path(@project), notice: "Task updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
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
