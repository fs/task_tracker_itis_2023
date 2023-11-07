module Comments
  module Creates
    class PrepareParams
      include Interactor

      delegate :comment_params, :task, :user, to: :context

      def call
        comment_params.merge!(prepared_comment_params)
      end

      private

      def prepared_comment_params
        {
          task: task,
          user: user
        }
      end
    end
  end
end
