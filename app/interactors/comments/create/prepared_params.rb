module Comments

  class Create
    class PreparedParams

      include Interactor
      delegate :user, :task, :comment_params, to: :context

      def call
        context.fail!(error: "Invalid comment data!") unless comment.valid?
        context.comment = comment
      end

      private

      def comment
        @comment = task.comments.new(comment_params)
        @comment.user = user
      end

    end
  end
end