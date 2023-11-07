module Tasks
  class Update
    include Interactor::Organizer
    
    delegate :task, :project, to: :context

    organize Tasks::Save

    after do
      TaskMailer.task_updated(project, task).deliver_later
    end
  end
end
