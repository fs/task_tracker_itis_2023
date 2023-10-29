module Tasks
  class Destroy
    include Interactor

    delegate :task, to: :context

    def call
      context.fail!(error: "Fail..") unless task.destroy
      context.notice = "task successfully deleted"
    end
  end
end
