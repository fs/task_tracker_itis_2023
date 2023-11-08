module Tasks  
  module Destroyes  
    class SendNotification  
      include Interactor 

      delegate :task, :user, to: :context  
      delegate :project, to: :task  

      def call  
        if initiator_is_owner? 
          TaskMailer.task_destroyed_to_initiator_owner(task.project, task, user).deliver_later 
        else 
          TaskMailer.task_destroyed_to_initiator_member(task.project, task, user).deliver_later
          TaskMailer.task_destroyed_to_owner(task.project, task)
        end  
        TaskMailer.task_destroyed_to_members(task.project, task, user).deliver_later  
      end  

      private

      def initiator_is_owner?  
        ProjectMembership.find_by(project: task.project, user: user).owner?  
      end  
    end  
  end  
end  
