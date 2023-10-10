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
end
