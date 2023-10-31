module Comments
  class Update
    include Interactor

    delegate :comment, :comment_params, to: :context

    def call
      context.fail!(error: "Fail..") unless comment.update(comment_params)
      context.notice = "Comment successfully update"
    end
  end
end