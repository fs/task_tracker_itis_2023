module Tasks
  class Update
    include Interactor::Organizer
    delegate :project, to: :context

    organize Tasks::Save
    after do
      TaskMailer.task_update(project, context.task).deliver_later
    end
  end
end
