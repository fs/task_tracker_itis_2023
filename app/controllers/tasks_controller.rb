# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = @project.tasks.order(params[:sort]).page(params[:page]).per(3) if @project
  end

  def show
    @task
  end

  def new
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build
    @task.created_at = Time.now
    @task.deadline_at = 1.week.from_now
  end

  def edit
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end

  def update
    if @task.update(task_params)
      redirect_to project_tasks_path(@project, @task), notice: 'Updated Successful'
    else
      flash.now[:alert] = 'Something went wrong. Try again.'
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @task = @project.tasks.build(task_params)

    @task.deadline_at = @task.created_at + 1.week if @task.deadline_at.nil?

    if @task.save
      redirect_to project_tasks_path(@project, @task), notice: 'Created Successful'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to project_tasks_path(@project), notice: 'Task destroyed'
  end

  private

  def set_project
    @project = Project.find_by(id: params[:project_id])
  end

  def set_task
    @task = @project.tasks.find_by!(id: params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :status, :deadline_at)
  end
end
