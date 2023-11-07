module Tasks
  class Update
    include Interactor::Organizer

    delegate :task, to: :context

    organize Tasks::Save

    after do
      users = task.project.users

      users.each do |user|
        TaskMailer.task_updated(user, task).deliver_later
      end
    end
  end
end
