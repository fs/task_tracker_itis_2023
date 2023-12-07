# frozen_string_literal: true

module Tasks
  class Create
    class PrepareParams
      include Interactor

      delegate :params, to: :context

      def call
        context.task_params = prepared_task_params
      end

      private

      def prepared_task_params
        @prepared_task_params ||= params.require(:task).permit(:name, :description, :status, :deadline_at)
      end
    end
  end
end
