class UpdateComment
  include Interactor

  def call
    comment = context.comment
    comment_attributes = context.comment_attributes

    if comment.update(comment_attributes)
      context.comment_updated = true
      context.message = "Comment Gracefully Updated"
    else
      context.fail!(message: "Failed to update the comment" )
   end
 end
end
