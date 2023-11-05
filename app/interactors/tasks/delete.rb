module Tasks
  class Delete
    include Interactor

    delegate :task, to: :context

    def call
      if task.destroy
        context.status = :success
      else
        context.fail!(error: "Failed to delete task")
      end
    end
  end
end
