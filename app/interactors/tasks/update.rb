module Tasks
  class Update
    include Interactor::Organizer

    organize Tasks::Save

    after do
      TaskMailer.task_updated(project, task).deliver_later
    end
  end
end
