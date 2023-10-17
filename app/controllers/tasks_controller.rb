class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = @project.tasks.order(params[:sort]).page(params[:page]).per(8)
  end

  def show; end

  def new
    @task = @project.tasks.build
    @task.deadline_at ||= 1.week.from_now
  end

  def edit; end

  def create
    @task = @project.tasks.build(task_params)
    @task.status = "Just Started"

    if deadline_correct?(@task)
      if @task.save
        redirect_to project_tasks_path(@project), notice: "Task created successfully"
      else
        redirect_to project_path(@project)
        flash[:notice] = "Prohibited the task from being created : "+@task.errors.full_messages.to_sentence
      end
    else
      redirect_to project_path(@project)
      flash[:notice] = "Deadline can't be empty or before the creation date!"
    end

  end

  def update
    if @task.update(task_params)
      redirect_to project_tasks_path(@project), notice: "Task updated successfully"
    else
      render :edit, state: :unprocessable_entity
    end
  end

  def destroy
    #@task = Task.find_by!(params[:id]) For Deletion using project_task_delete_url(@task.project, @task)
    @task = set_task

    if @task.destroy
      redirect_to project_path(@task.project), notice: "Task has been deleted!"
    else
      flash[:notice] = "Something went wrong!"
    end
  end


  # PRIVATE METHODS FOR THE CLASS
  private

  def deadline_correct?(task)
    !task.deadline_at.nil? and task.deadline_at >= Date.today
  end

  def set_task
    #@project = set_project
    @task = Task.find_by!(id: params[:id])
  end


  def task_params
    params.require(:task).permit(:name, :description, :status, :deadline_at).merge(project_id: params[:project_id])

  end
  def set_project
    @project = Project.find_by(id: params[:project_id])
  end

end
