module Tasks 
  class Updating
    include Interactor

    delegate :task_params, :task, to: :context

    def call
      context.fail!(error: "Fail..") unless task.update(task_params)
      context.notice = "Task successfully updated"
    end
  end
end