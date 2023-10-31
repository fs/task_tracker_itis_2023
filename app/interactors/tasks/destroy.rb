module Tasks
  class Destroy
    include Interactor

    delegate :task, to: :context

    def call
      context.fail!(error: "Fail..") unless task.destroy
      context.notice = "Task successfully deleted"
    end
  end
end
