module Comments
    class Create
      class PrepareParams
        include Interactor
  
        delegate :params, to: :context
  
        def call
          context.comment_params = prepared_comment_params
        end
  
        private
  
        def prepared_comment_params
          @prepared_comment_params ||= params.require(:comment).permit(:content)
        end
      end
    end
  end