module Tasks

  class Save
    include Interactor

    delegate :task, to: :context

    def call
      context.fail!(error: "Unable to create the task!") unless task.save
      context.notice = "Task has been added!"
    end

  end
end