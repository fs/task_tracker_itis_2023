module Tasks
  class Destroy
    include Interactor

    delegate :task, to: :context

    def call
      destroy_task_or_fail
    end

    private

    def destroy_task_or_fail
      unless task.destroy
        context.fail!(error: "Failed to destroy task")
      end
    end
  end
end
