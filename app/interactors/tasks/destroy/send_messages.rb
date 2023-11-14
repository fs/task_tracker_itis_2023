module Tasks
  module Destroy
    class SendMessages
      include Interactor

      delegate :task, :user, :project, to: :context

      def call
        TaskMailer.task_destroyed_to_deleter(project, task, user).deliver_later
        if owner?
          TaskMailer.task_destroyed_to_members(project, task, project.users.without(user)).deliver_later
        else
          owner = project.users.where(project_memberships: { role: :owner })
          TaskMailer.task_destroyed_to_owner(project, task, owner).deliver_later
          TaskMailer.task_destroyed_to_members(project, task, project.users.excluding(user, owner)).deliver_later
        end
      end

      private

      def project_membership
        @project_membership ||= ProjectMembership.find_by(project: task.project, user: user)
      end

      def owner?
        project_membership.owner?
      end
    end
  end
end
