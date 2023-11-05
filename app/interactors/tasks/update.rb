module Tasks
  class Update
    include Interactor

    delegate :task, :task_params, to: :context

    def call
      if task.update(task_params)
        context.status = :success
      else
        context.fail!(error: "Failed to update task")
      end
    end
  end
end
