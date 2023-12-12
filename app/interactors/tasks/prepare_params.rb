module Tasks
  class PrepareParams
    include Interactor

    delegate :task_params, :project, to: :context

    def call
      build_task
    end

    private

    def build_task
      context.task = project.tasks.build(task_params)
    end
  end
end
