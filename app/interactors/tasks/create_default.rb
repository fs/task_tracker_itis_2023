module Tasks
  class CreateDefault
    include Interactor

    delegate :project_id, to: :context

    def call
      context.fail!(error: "Invalid data") unless Task.create(task_params)
    end

    private

    def task_params
      [
        {
          project_id: project_id,
          name: "АНЖУМАНИЯ",
          status: :unstarted,
          deadline_at: 1.week.from_now
        },
        {
          project_id: project_id,
          name: "БЕГИТ",
          status: :unstarted,
          deadline_at: 1.week.from_now
        }
      ]
    end
  end
end
