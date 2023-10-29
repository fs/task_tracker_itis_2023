module Tasks
  class Save
    include Interactor

    delegate :task, :task_params, to: :context

    before do
      context.task ||= Task.new
    end

    def call
      context.fail!(error: "Invalid data") unless task.update(task_params)
    end
  end
end
