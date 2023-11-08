module Tasks
  class Save
    include Interactor

    delegate :task, to: :context

    def call
      context.fail!(error: "Invalid data") unless task.save
    end
  end
end
