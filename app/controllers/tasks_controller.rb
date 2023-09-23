class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = @project.tasks.all
  end

  def show
    @task = @project.tasks.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = @project.tasks.build(task_params)
    @task.deadline = params[:task][:deadline] # Добавьте эту строку, чтобы установить deadline
    @task.state = params[:task][:state] # Добавьте эту строку, чтобы установить deadline

    if @task.save
      redirect_to project_tasks_path(@project), notice: 'Задача создана успешно.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to project_task_path(@project, @task), notice: 'Задача обновлена успешно.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to project_tasks_path(@project), notice: 'Задача удалена успешно.'
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @task = @project.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :deadline, :state)
  end
end
