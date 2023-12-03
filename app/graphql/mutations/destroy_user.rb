module Mutations
  class DestroyUser < BaseMutation
    argument :input, Types::Inputs::DestroyUserInput, required: true

    type Types::UserType

    def resolve(input:)
      input_params = input.to_h

      result = Users::Destroys::DestroyRecord.call(
        user: ::User.find(input_params.delete(:id))
      )

      result.user
    end
  end
end
