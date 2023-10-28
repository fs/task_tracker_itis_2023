module Tasks

  class Update
    include Interactor

    delegate :task_params, :task, to: :context

    def call
      context.fail!(error: "Failed to update the task") unless task.update(task_params)
      context.notice = "Task has been updated!"
    end
  end
end