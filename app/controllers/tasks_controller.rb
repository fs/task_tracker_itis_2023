class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, only: %i[show edit update destroy]
  before_action -> { authorize! @task }, only: %i[update edit show destroy]

  def index
    @task = Task.new(project: @project)
    authorize! @task

    @tasks = @project.tasks.order(params[:sort]).page(params[:page]).per(3)
  end

  def show; end

  def new
    @task = @project.tasks.build
    @task.deadline_at ||= 1.week.from_now

    authorize! @task
  end

  def edit; end

  def create
    @task = create_task.task

    if @task.save
      authorize! @task
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
    if @task.destroy
      redirect_to project_tasks_path(@project), notice: "Task destroyed"
    else
      redirect_to project_tasks_path(@project), notice: "Failed to destroy Task "
    end
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

  def create_task
    @create_task ||= ::Tasks::Create.call(task_params: task_params, project: @project)
  end

  def update_task
    ::Tasks::Update.call(task: @task, task_params: task_params)
  end

  def delete_task
    ::Tasks::Delete.call(task: @task)
  end
end
