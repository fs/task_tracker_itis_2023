class TasksController < ApplicationController
  before_action :get_proj
  before_action :get_task, only: %i[show update edit destroy]


  def index
    @tasks = @proj.tasks
  end

  def show; end

  def edit; end

  def new
    @task = @proj.tasks.build
  end

  def update
    if @task.update(task_params)
        redirect_to '/', notice: "Update Successful"
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def create
    @task = @proj.tasks.build(task_params)

    if @task.save
      redirect_to "/", notice: "Task created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to "/"
  end

  private

  def get_proj
    @proj = Project.find_by(id: params[:project_id])
  end

  def get_task
    @task = @proj.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :state, :deadline)
  end
end