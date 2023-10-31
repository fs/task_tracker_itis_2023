module Authorization
  extend ActiveSupport::Concern

  included do
    verify_authorized

    rescue_from ActionPolicy::Unauthorized, with: :deny_access!
  end

  private

  def deny_access!(error)
    redirect_to root_path, alert: error.message
  end
end
