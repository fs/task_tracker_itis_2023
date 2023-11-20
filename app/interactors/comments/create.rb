module Comments
    class Create
      include Interactor
  
      delegate :task, :comment_params, :user, to: :context
      def call
        context.comment = comment
  
        context.fail!(error: "Invalid data") unless comment.save
      end
  
      private
  
      def comment
        @comment ||= task.comments.new(comment_params)
        @comment.user = user
        @comment
      end
    end
  end