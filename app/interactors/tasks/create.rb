module Tasks
  class Create
    include Interactor::Organizer

    delegate :task, :project, to: :context
    delegate :project, to: :task

    organize Tasks::Creates::PrepareParams,
             Tasks::Save

    after do
      TaskMailer.task_created_for_members(project, task).deliver_later
      TaskMailer.task_created_(project, task).deliver_later
    end
  end
end
