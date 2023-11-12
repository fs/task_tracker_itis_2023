module Tasks
  class Update

    delegate :project, to: :context
    include Interactor::Organizer

    organize Tasks::Save

    after do 
      TaskMailer.task_update(project, context.task).deliver_later
    end 
  end
end
