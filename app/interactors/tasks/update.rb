module Tasks
  class Update
    include Interactor

    delegate :task_params, :task, to: :context

    def call
      update_task_or_fail
    end

    private

    def update_task_or_fail
      unless task.update(task_params)
        context.fail!(error: "Failed to update task")
      end
    end
  end
end
