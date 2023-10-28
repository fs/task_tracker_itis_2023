module Tasks

  class Create

    class PreparedParams
      include Interactor

      delegate :task_params, :project, to: :context

      def call
        @task = project.tasks.build(task_params)

        context.fail!(error: "Invalid task details!") unless @task.valid?
        context.task = @task
      end
    end

  end
end