module Tasks

  class Create

    class PreparedParams
      include Interactor

      delegate :task_params, :project, to: :context
      def call
        @task = project.tasks.build(task_params)
        context.task = @task

        context.fail!(error: "Invalid task details!") unless @task.valid?
      end
    end

  end
end