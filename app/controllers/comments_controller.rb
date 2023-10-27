class CommentsController < ApplicationController
  before_action :set_task
  before_action :set_comment, only: %i[update destroy]

  def edit
    @comment = Comment.find(params[:id])
    authorize! @comment
  end

  def create
    @comment = create_comment.comment
    authorize! @comment

    if create_comment.success?
      redirect_to project_task_path(@task.project, @task), notice: "Comment created successfully"
    else
      redirect_to project_task_path(@task.project, @task), alert: "Failed to create comment"
    end
  end

  def update
    authorize! @comment

    if update_comment.success?
      redirect_to project_task_path(@task.project, @task), notice: "Comment updated successfully"
    else
      redirect_to project_task_path(@task.project, @task), alert: "Failed to update comment"
    end
  end

  def destroy
    authorize! @comment

    if destroy_comment.success?
      redirect_to project_task_path(@task.project, @task), notice: "Comment deleted successfully"
    else
      redirect_to project_task_path(@task.project, @task), alert: "Failed to delete comment"
    end
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def create_comment
    @create_comment ||= ::Comments::Create.call(params: params, task: @task, current_user: current_user)
  end

  def update_comment
    ::Comments::Update.call(params: params, comment: @comment)
  end

  def destroy_comment
    ::Comments::Destroy.call(comment: @comment)
  end
end
