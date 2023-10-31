class ApplicationController < ActionController::Base
rescue_from ActionPolicy::Unauthorized do
  redirect_to root_path, alert: 'Access Denied'
end
end
