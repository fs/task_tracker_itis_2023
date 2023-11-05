module Tasks
  class Save
    include Interactor

    delegate :task, to: :context

    def call
      context.fail!(error: "Invalid task details!") unless task.valid?
      task.save
    end
  end
end
