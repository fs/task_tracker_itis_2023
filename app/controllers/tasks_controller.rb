class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, only: %i[show edit update destroy]
  before_action -> { authorize! @task }, only: %i[edit update show destroy]

  def index
    @task = Task.new(project: @project)
    authorize! @task

    @tasks = @project.tasks.order(params[:sort]).page(params[:page]).per(6)
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
    authorize! @task

    if create_task.success?
      redirect_to project_tasks_path(@project), notice: "Task created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if update_task.success?
      redirect_to project_tasks_path(@project), notice: "Task updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    return unless destroy_task.success?

    redirect_to project_tasks_path(@project), notice: "Task destroyed"
  end

  private

  def set_project
    @project = Project.find_by(id: params[:project_id])
  end

  def set_task
    @task = @project.tasks.find(params[:id])
  end

  def create_task
    @create_task ||= ::Tasks::Create.call(task_params: task_params, project: @project)
  end

  def update_task
    ::Tasks::Update.call(task_params: task_params, task: @task)
  end

  def destroy_task
    ::Tasks::Destroy.call(task: @task, user: current_user)
  end

  def task_params
    params.require(:task).permit(:name, :description, :status, :deadline_at)
  end
end
