module Comments
  class Update
    include Interactor

    delegate :comment, :comment_params, to: :context

    def call
      if comment.update(comment_params)
        context.status = :success
      else
        context.fail!(error: "Failed to update comment")
      end
    end
  end
end
