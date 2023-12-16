module Comments
  class Save
    include Interactor

    delegate :task, :comment_params, :user, to: :context

    def call
      context.comment = comment
      comment.user = user

      context.fail!(error: "Invalid data") unless comment.save
    end

    private

    def comment
      @comment ||= task.comments.new(comment_params)
    end
  end
end