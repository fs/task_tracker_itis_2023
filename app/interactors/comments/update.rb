module Comments
  class Update
    include Interactor

    delegate :comment, :comment_params, to: :context

    def call
      context.fail!(error: "Comment not updated") unless comment.update(comment_params)
    end
  end
end