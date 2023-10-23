module Authentication
  extend ActiveSupport::Concern

  class UserNotAuthenticated < StandardError; end

  included do
    rescue_from UserNotAuthenticated, with: :not_authenticated!

    helper_method :current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id])
  end

  def authenticate_current_user!
    return if session[:current_user_id] && current_user.present?

    raise UserNotAuthenticated, "No current_user_id in session"
  end

  private

  def not_authenticated!
    redirect_to login_path, alert: "You are not logged in"
  end
end
