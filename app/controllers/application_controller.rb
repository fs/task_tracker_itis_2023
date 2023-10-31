class ApplicationController < ActionController::Base
  include Authentication
  include Authorization
end
