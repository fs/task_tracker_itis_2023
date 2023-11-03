module Projects
  class Create
    include Interactor::Organizer

    delegate :project, :user, to: :context

    organize Projects::Save,
             Projects::Creates::CreateOwner

    after do
      ProjectMailer.project_created(project, user).deliver_later
      Projects::CreateDefaultTasksJob.perform_async(project.id)
    end
  end
end
