module Tasks
  class Destroy
    class DestroyRecord
      include Interactor

      delegate :task, to: :context

      def call
        context.task_params = JSON.parse(task.attributes.to_json)
        context.project = task.project

        task.destroy
      end
    end
  end
end