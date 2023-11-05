module Tasks
  class Update
    include Interactor::Organizer

    organize Tasks::Save

    after do
      task = context.task
      project = task.project
      users = project.users

      users.each do |user|
        TaskMailer.task_updated(user, task).deliver_later
      end
    end
  end
end
