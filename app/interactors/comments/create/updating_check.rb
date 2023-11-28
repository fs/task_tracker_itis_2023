module Comments
    class UpdatingCheck
      include Interactor
  
      delegate :comment, :comment_params, to: :context
  
      def call
        context.comment = comment
  
        context.fail!(error: "Invalid data") unless comment.update(comment_params)
      end
    end
  end