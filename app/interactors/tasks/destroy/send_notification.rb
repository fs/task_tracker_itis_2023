module Tasks
  class Destroy
    class SendNotification
      include Interactor

      delegate :task_params, :project, :user, to: :context

      def call
        deliver_emails_to_initiator

        TaskMailer.task_destroyed_to_members(project, task_params, user).deliver_later
      end

      private

      def deliver_emails_to_initiator
        if initiator_is_owner?
          TaskMailer.task_destroyed_to_initiator_owner(project, task_params, user).deliver_later
        else
          TaskMailer.task_destroyed_to_initiator_member(project, task_params, user).deliver_later
          TaskMailer.task_destroyed_to_owner(project, task_params).deliver_later
        end
      end

      def initiator_is_owner?
        ProjectMembership.find_by(project: project, user: user).owner?
      end
    end
  end
end