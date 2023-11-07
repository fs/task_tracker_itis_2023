module Tasks
  class Create
    include Interactor::Organizer

    delegate :task, to: :context
    delegate :project, to: :task

    organize Tasks::Creates::PrepareParams,
             Tasks::Save

    after do
      TaskMailer.task_created_to_owner(project, task).deliver_later
      TaskMailer.task_created_to_members(project, task).deliver_later
    end
  end
end
