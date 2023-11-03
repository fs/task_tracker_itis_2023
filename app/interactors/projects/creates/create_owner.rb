module Projects
  module Creates
    class CreateOwner
      include Interactor

      delegate :project, :user, to: :context

      def call
        raise_error unless owner_membership.save
      end

      private

      def owner_membership
        @owner_membership ||= ProjectMembership.new(prepared_owner_membership_params)
      end

      def prepared_owner_membership_params
        {
          project: project,
          user: user,
          role: :owner
        }
      end

      def raise_error
        project.destroy
        context.fail!(error: "Invalid data")
      end
    end
  end
end
