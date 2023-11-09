module Tasks
  class Create
    include Interactor::Organizer

    delegate :task, :project, to: :context
    delegate :project, to: :task

    organize Tasks::Creates::PrepareParams,
             Tasks::Save

    after do
      TaskMailer.notify_members_task_created(project, task).deliver_later
      TaskMailer.notify_owner_task_created(project, task).deliver_later
    end
  end
end
