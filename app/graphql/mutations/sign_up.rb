module Mutations
  class SignUp < Mutations::BaseMutation
    argument :input, Types::Inputs::SignUpInput, required: true

    type Types::Payloads::SignUpPayload

    def resolve(input:)
      result = Users::Save.call(user_params: input.to_h)

      result.to_h.merge(errors: formatted_errors(result.user))
    end
  end
end
