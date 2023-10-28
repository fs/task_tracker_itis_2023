module Tasks

  class Delete
    include Interactor

    delegate :task, to: :context

    def call
      context.fail!(error: "Something went wrong, project cannot be deleted!") unless task.delete
      context.notice = "Task has been deleted!"
    end
  end
end