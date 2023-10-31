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
    @comment = update_comment

    if @comment.success?
      redirect_to project_task_path(@task.project, @task), notice: @comment.notice
    else
      redirect_to project_task_path(@task.project, @task), alert: @comment.error
    end
  end

  def destroy
    authorize! @comment
    @comment = destroy_comment
    if @comment.success?
      redirect_to project_task_path(@task.project, @task), notice: @comment.notice
    else
      redirect_to project_task_path(@task.project, @task), alert: @comment.error
    end
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

  def destroy_comment
    @destroy_comment ||= ::Comments::Destroy.call(comment: @comment)
  end

  def create_comment
    @create_comment ||= ::Comments::Create.call(task: @task, 
                                                comment_params: comment_params, 
                                                user: current_user)
  end

  def update_comment
    @update_comment ||= ::Comments::Update.call(comment: @comment,
                                                comment_params: comment_params)
  end
end
