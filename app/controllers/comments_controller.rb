class CommentsController < ApplicationController
  before_action :set_task, only: %i[edit update destroy create]
  before_action :set_comment, only: %i[edit update destroy]
  before_action :authenticate_current_user!

  def edit
    authorize! @comment
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.task = @task
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
      redirect_to project_task_path(@task.project, @task), notice: "Comment updated successfully."
    else
      render :edit
    end
  end

  def destroy
    authorize! @comment
    @comment.destroy
    redirect_to project_task_path(@task.project, @task), notice: "Comment deleted successfully."
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
