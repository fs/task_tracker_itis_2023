class TasksController < ApplicationController

  before_action :set_project, only: [:update, :show, :delete]

  def index
    @tasks = Task.all.order("created_at DESC")
  end
  def new
    #@project = set_project
    @task = Task.new
  end

  def show
    @task = set_task
  end

  def edit
    @task = set_task
  end

  def create
    #@project = set_project
    @task = Task.new(task_params)
    @task.state = "Just started"
    @project = @task.project

    if @task.deadline.nil? == false and @task.deadline >= Date.today
      if @task.save
        redirect_to project_path(@project), notice: "Task has been added!"
      else
        flash[:notice] = "Something went wrong! Don't leave empty sections"
      end
    else
      redirect_to project_path(@project)
      flash[:notice] = "Deadline can't be empty or before the creation date!"
    end

  end

  def update
    @task = set_task

    if @task.update(task_params)
      redirect_to project_task_path(@task), notice: "Task has been updated!"
    else
      flash[:notice] = "Something went wrong!"
    end
  end

  def destroy
    #@task = Task.find_by(params[:id]) FOR button_to
    @task = set_task

    if @task.destroy
      redirect_to project_path(@task.project), notice: "Task has been deleted!"
    else
      flash[:notice] = "Something went wrong!"
    end
  end

  private

  def set_task
    #@project = set_project
    @task = Task.find_by(id: params[:id])
  end

  def set_project
    @task = set_task
    @project = @task.project
  end

  def task_params
    params.require(:task).permit(:task_title, :task_description, :state, :deadline).merge(project_id: params[:project_id])
  end
end
