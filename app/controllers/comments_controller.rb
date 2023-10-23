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
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @assignment = Assignment.find(params[:assignment_id])
    @comment.assignment = @assignment
    if @comment.save
      flash[:notice] = "Comment gracefully posted"
      redirect_to @comment.assignment
    else
      flash[:alert] = "Couldn't post the comment"
      render :new
    end
  end

  def index
    @comments = Comment.all
  end


  def update
    # comment = current_user.comments.build(comment_params)
    # @assignment = Assignment.find(params[:assignment_id])

    @comment = Comment.find(params[:id])
    # respond_to do |format|

    if @comment.update(comment_params)
       respond_to do |format|
         format.html { redirect_to @comment.assignment }
         format.js {render json: {content: @comment.content}}
       end
      # render json: { success: true, updated_comment: @comment.content }
    else
      # format.html{ render :edit}
      # format.js
      #  render json: {  success: false, errors: @comment.errors.full_message }
      render :edit
    end
  end



  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url, notice: "Comment gracefully destroyed." }
      format.json { head :no_content }
    end
  end


  def comment_params
    params.require( :comment).permit( :content, :user_id, :assignment_id)
  end

end
