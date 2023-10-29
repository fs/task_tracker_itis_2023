module Comments

  class Create
    class PreparedParams

      include Interactor
      delegate :user, :task, :comment_params, to: :context

      def call
        @comment = comment
        @comment.user = user

        if !@comment.nil?
          context.comment = @comment
        else
          context.fail!(error: "Invalid comment data!")
        end
      end

      private

      def comment
        @comment = task.comments.new(comment_params)
      end

    end
  end
end