module AuthenticableGraphqlUser
  extend ActiveSupport::Concern

  private

  def ready?(*)
    return true if current_user

    raise GraphQL::ExecutionError, "Invalid credentials"
  end
end
