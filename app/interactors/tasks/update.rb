module Tasks
  class Update
    include Interactor

    delegate :task, :task_params, to: :context

    def call
      context.fail!(error: "Failed params") unless task.update(task_params)
      context.notice = "task successfully updated"
    end

  end
end
