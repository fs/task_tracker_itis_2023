module Comments
  class Create
    include Interactor

    delegate :task, :comment_params, :user, to: :context

    def call
      build_comment
      save_comment_or_fail
    end

    private

    def build_comment
      context.comment = task.comments.build(comment_params)
      context.comment.user = user
    end

    def save_comment_or_fail
      unless context.comment.save
        context.fail!(error: "Failed to create comment")
      end
    end
  end
end
