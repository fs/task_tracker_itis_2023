module Tasks
  class Create
    include Interactor::Organizer

    delegate :project, to: :context

    organize Tasks::Creates::PrepareParams,
             Tasks::Save

    after do
      TaskMailer.task_created(project, context.task).deliver_later
    end
  end
end
