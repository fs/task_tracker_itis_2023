class TasksController < ApplicationController
  before_action :get_proj, only: %i[new create show index edit update destroy]


  def get_proj
    @proj = Project.find(params[:project_id]) 
  end


  def index
    @tasks = @proj.tasks.all
  end

  def show; end

  def edit; end

  def new
    @task = @proj.tasks.new
  end

  def update
    if @task.update(task_params)
        redirect_to '/', notice: "Update Successful"
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def create
    @task = @proj.tasks.new(task_params)

    if (@task.save)
      redirect_to "/", notice: "Task created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @task = @proj.tasks.find(params[:id])
    @task.destroy
    redirect_to "/"
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :state, :deadline)
  end
end