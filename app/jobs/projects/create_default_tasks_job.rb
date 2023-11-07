module Projects
  class CreateDefaultTasksJob
    include Sidekiq::Worker

    sidekiq_options queue: :default, retry: 3

    def perform(project_id)
      Tasks::CreateDefault.call!(project_id: project_id)
    end
  end
end
