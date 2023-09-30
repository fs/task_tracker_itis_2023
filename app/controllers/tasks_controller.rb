class TasksController < ApplicationController
  before_action :set_project, only: %i[index show create]

  def index
    @tasks = @project.tasks if @project
  end

  def show
    @task = @project.tasks.find(params[:id])
  end

  def new
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build
  end

  def create
    @task = @project.tasks.build(task_params)

    if @task.save
      redirect_to project_tasks_path(@project, @task), notice: 'Created Successful'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_project
    @project = Project.find_by(id: params[:project_id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :status, :deadline)
  end
end
