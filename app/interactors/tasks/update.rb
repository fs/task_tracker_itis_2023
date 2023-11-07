module Tasks
  class Update
    include Interactor::Organizer
    
    delegate :task, to: :context

    organize Tasks::Save

    after do
      TaskMailer.task_updated(project, task).deliver_later  
    end

    def project  
      @project ||= task.project  
    end  
  end
end
