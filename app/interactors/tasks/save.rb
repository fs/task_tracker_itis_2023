module Tasks
  class Save
    include Interactor

    delegate :project, :task_params, to: :context

    def call
      context.task = task

      context.fail!(error: "Invalid data") unless task.save
    end

    private

    def task
      @task ||= project.tasks.build(task_params)
    end
  end
end