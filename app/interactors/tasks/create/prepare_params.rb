module Tasks
  class Create
    class PrepareParams
      include Interactor

      delegate :task_params, :project, to: :context

      def call
        context.task = task
      end

      private

      def task
        @task ||= project.tasks.build(task_params)
      end
    end
  end
end