module Api
  class ApplicationController < ActionController::API
    include JwtTokenAuthentication
  end
end
