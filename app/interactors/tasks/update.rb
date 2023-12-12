module Tasks
  class Update
    include Interactor::Organizer

    organize Tasks::Save

    delegate :task, :project, to: :context

    after do
      TaskMailer.task_updated(project, task).deliver_later
    end
  end
end
