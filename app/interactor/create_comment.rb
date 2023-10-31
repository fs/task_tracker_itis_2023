class CreateComment
  include Interactor

  def call
    assignment = context.assignment
    user = context.user
    comment_params = context.comment_params


    comment = Comment.new(comment_params)
    comment.user = user
    comment.assignment = assignment

    if comment.save
      context.comment = comment
      context.message = "Comment Gracefully created"
      else
        context.fail!(message: "Failed to create the comment")
    end
  end
end
