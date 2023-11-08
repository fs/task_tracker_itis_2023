class CommentsController < ApplicationController
  before_action :set_task
  before_action :set_comment, only: %i[edit update destroy]
  before_action :authorize_comment, only: %i[destroy]

  def edit
    authorize! @comment
  end

  def create
    @comment = @task.comments.build(comment_params)
    @comment.user = current_user
    authorize! @comment

    if @comment.save
      redirect_to project_task_path(@task.project, @task), notice: "Comment created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize! @comment

    if @comment.update(comment_params)
      redirect_to project_task_path(@task.project, @task), notice: "Comment updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    redirect_to project_task_path(@task.project, @task), notice: "Comment destroyed"
  end

  private

  def set_task
    @task = Task.find_by(id: params[:task_id])
  end

  def authorize_comment
    authorize! @comment
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
