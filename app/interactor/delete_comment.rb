class DeleteComment
  include Interactor

  def call
    comment = context.comment

    if comment.destroy
      context.comment_deleted
      context.message = "Comment Deleted Gracefully"
    else
      context.fail!(message: "Failed to delete the comment")
    end
  end
end
