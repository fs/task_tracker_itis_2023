module JwtTokenAuthentication
  extend ActiveSupport::Concern

  def current_user
    return if access_token.blank?

    User.find_by(id: payload["sub"])
  end

  def access_token
    # Authorization: Bearer jie.123.ae
    @access_token ||= request.headers["Authorization"]&.split&.last
  end

  def payload
    ::JWT.decode(
      access_token, jwt_secret, true, { algorithm: "HS256" }
    ).first
  end

  def jwt_secret
    ENV.fetch("JWT_SECRET")
  end
end
