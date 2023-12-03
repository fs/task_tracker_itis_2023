module Users
  module Destroys
    class SendNotification
      include Interactor

      delegate :user_params, :user, to: :context

      def call
        deliver_emails_to_initiator

        UserMailer.user_destroyed(user).deliver_later
      end
    end
  end
end
