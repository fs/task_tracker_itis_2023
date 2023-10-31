class CommentsController < ApplicationController

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @assignment = Assignment.find(params[:assignment_id])
    @comment = Comment.new

  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @assignment = Assignment.find(params[:assignment_id])
    @comment = current_user.comments.build(comment_params)
    @comment.assignment = @assignment

    result = CreateComment.call(
      assignment: @assignment,
      user: current_user,
      comment_params: comment_params
    )
    if result.success?
      redirect_to assignment_path(@assignment), notice: result.message
     else
      redirect_to assignment_path(@assignment), notice: result.message
    end
    # if @comment.save
    #   flash[:notice] = "Comment gracefully posted"
    #   redirect_to @comment.assignment
    # else
    #   flash[:alert] = "Couldn't post the comment"
    #   render :new
    # end
  end


  def index
    @comments = Comment.all
  end


  def update
    # comment = current_user.comments.build(comment_params)
    # @assignment = Assignment.find(params[:assignment_id])

    @comment = Comment.find(params[:id])
    comment_params = params.require(:comment).permit(:content)

    result = UpdateComment.call(comment: @comment, comment_attributes: comment_params)

    if result.success?
      redirect_to @comment.assignment, notice: result.message
    else
      redirect_to @comment.assignment, alert: result.message
    end
    # if @comment.update(comment_params)
    #    respond_to do |format|
    #      format.html { redirect_to @comment.assignment }
    #      format.js {render json: {content: @comment.content}}
    #    end
    # else
    #   render :edit
    # end
  end



  def destroy
     @comment = Comment.find(params[:id])

     result = DeleteComment.call(comment: @comment)

     if result.success?
      redirect_to @comment.assignment, notice: result.message
     else
      redirect_to @comment.assignment, notice: result.message
     end

    # @comment.destroy

    # respond_to do |format|
    #   format.html { redirect_to assignment_path(@comment.assignment), notice: "Comment gracefully destroyed." }
    #   format.json { head :no_content }
    # end
  end


  def comment_params
    params.require( :comment).permit( :content, :user_id, :assignment_id)
  end

end
