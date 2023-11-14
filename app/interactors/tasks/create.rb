module Tasks
  class Create
    include Interactor::Organizer

    delegate :project, :task, to: :context

    organize Tasks::Creates::PrepareParams,
             Tasks::Save

    after do
      TaskMailer.task_created_to_owner(project, task).deliver_later
      TaskMailer.task_created_to_member(project, task).deliver_later
    end
  end
end
