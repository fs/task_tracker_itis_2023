module Users
  class Save
    include Interactor

    delegate :user_params, to: :context

    def call
      context.user = user

      context.fail! unless user.update(user_params)
    end

    private

    def user
      @user ||= context.user || User.new
    end
  end
end
