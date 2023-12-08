module Mutations
  class DestroyProject < BaseMutation
    argument :input, Types::Inputs::DestroyProjectInput, required: true

    type Types::Payloads::ProjectPayload

    def resolve(input:)
      input_params = input.to_h

      result = Projects::Destroy.call(
        project: Project.find(input_params.delete(:id))
      )

      result.to_h.merge(errors: formatted_errors(result.project))
    end
  end
end
