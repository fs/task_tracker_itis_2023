module Projects
  class CreateDefaultTasksJob
    include Sidekiq::Worker

    sidekiq_options queue: :default, retry: 3

    def perform(project_id)
      project = Project.find(project_id)

      project.tasks.create(
        [
          { name: "Your first task", status: :unstarted, deadline_at: 1.week.from_now }
        ]
      )
    end
  end
end
