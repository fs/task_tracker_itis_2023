module Comments
  class Update
    include Interactor

    delegate :comment, :comment_params, to: :context

    def call
      update_comment_or_fail
    end

    private

    def update_comment_or_fail
      unless comment.update(comment_params)
        context.fail!(error: "Failed to update comment")
      end
    end
  end
end
