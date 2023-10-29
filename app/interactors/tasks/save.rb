module Tasks
  class Save
    include Interactor

    delegate :project, :task_params, to: :context

    def call
      context.task = task

      context.fail!(error: "Fail..") unless task.save
      context.notice = "Task saved!"
    end

    private

    def task
      @task ||= project.tasks.build(task_params)
    end
  end
end
