module Tasks
  class Save
    include Interactor

    delegate :task, to: :context

    def call
      save_task_or_fail
    end

    private

    def save_task_or_fail
      unless task.save
        context.fail!(error: "Failed to save task")
      end
    end
  end
end
