module Users
  class Destroy
    include Interactor

    delegate :user, to: :context

    def call
      user.destroy
    end
  end
end
