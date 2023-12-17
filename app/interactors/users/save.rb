module Users
  class Save
    include Interactor

    delegate :user, :user_params, to: :context

    before do
      context.user ||= User.new
    end

    def call
      context.fail!(error: "Invalid data") unless user.update(user_params)
    end
  end
end
