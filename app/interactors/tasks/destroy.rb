module Tasks
  class Destroy
    include Interactor

    delegate :task, to: :context

    def call
      context.fail!(error: "Task didn't delete") unless task.destroy()
      context.notice = "task successfully deleted"
    end

  end
end
