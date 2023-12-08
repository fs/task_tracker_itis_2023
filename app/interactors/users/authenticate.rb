module Users
  class Authenticate
    include Interactor

    delegate :credentials, to: :context

    def call
      context.fail!(errors: errors) unless user_authenticated?

      context.access_token = access_token
    end

    private

    def access_token
      JWT.encode(payload, jwt_secret, "HS256")
    end

    def errors
      [{ message: "Wrong credentials" }]
    end

    def jwt_secret
      ENV.fetch("JWT_SECRET")
    end

    def payload
      {
        sub: user.id
      }
    end

    def user
      @user ||= User.find_by(email: credentials[:email])
    end

    def user_authenticated?
      user&.authenticate(credentials[:password])
    end
  end
end
