module Tasks
  module Destroy
    class DestroyTask
      include Interactor

      delegate :task, to: :context

      def call
        task.destroy
      end
    end
  end
end
