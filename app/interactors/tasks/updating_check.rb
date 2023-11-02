module Tasks
  class UpdatingCheck
    include Interactor

    delegate :task, :task_params, to: :context

    def call
      context.task = task

      context.fail!(error: "Invalid data") unless task.update(task_params)
    end
  end
end