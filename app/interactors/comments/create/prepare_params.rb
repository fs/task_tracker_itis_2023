module Comments
  class Create
    class PrepareParams
      include Interactor

      delegate :comment_params, :task, :user, to: :context

      def call
        context.comment = task.comments.new(comment_params)
        context.comment.user = user
      end
    end
  end
end
