module Mutations
  class UpdateUser < BaseMutation
    argument :input, Types::Inputs::UpdateUserInput

    type Types::Payloads::UpdateUserPayload

    def resolve(input:)
      result = Users::Update.call(user_params: input.to_h, user: current_user)

      result.to_h.merge(errors: formatted_errors(result.user))
    end
  end
end
