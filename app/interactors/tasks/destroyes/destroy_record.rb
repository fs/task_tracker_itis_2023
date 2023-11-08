module Tasks
  module Destroyes
    class DestroyRecord
      include Interactor

      delegate :task, to: :context

      def call
        task.destroy
      end
    end
  end
end
