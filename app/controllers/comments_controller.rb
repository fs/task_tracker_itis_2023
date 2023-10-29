class CommentsController < ApplicationController
  before_action :find_task
  before_action :find_comment, only: %i[update destroy]
  def edit
    @comment = Comment.find(params[:id])
    authorize! @comment
  end

  def create
    @comment = @task.comments.new(comment_params)
    @comment.user = current_user

    authorize! @comment
    if @comment.save
      redirect_to project_task_path(@task.project, @task), notice: "Comment created successfully"
    else
      redirect_to project_task_path(@task.project, @task), alert: "Failed to create comment"
    end
  end

  def update
    authorize! @comment
    if @comment.update(comment_params)
      redirect_to project_task_path(@task.project, @task), notice: "Comment updated successfully"
    else
      redirect_to project_task_path(@task.project, @task), alert: "Failed to update comment"
    end
  end

  def destroy
    authorize! @comment
    if @comment.destroy
      redirect_to project_task_path(@task.project, @task), notice: "Comment deleted successfully"
    else
      redirect_to project_task_path(@task.project, @task), alert: "Failed to delete comment"
    end
  end

  private

  def find_task
    @task = Task.find(params[:task_id])
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
