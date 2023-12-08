module Mutations
  class UpdateProject < BaseMutation
    include AuthenticableGraphqlUser

    argument :input, Types::Inputs::UpdateProjectInput, required: true

    type Types::Payloads::ProjectPayload
    def resolve(input:)
      input_params = input.to_h

      result = Projects::Update.call(
        project: ::Project.find(input_params.delete(:id)),
        project_params: input_params
      )

      result.to_h.merge(errors: formatted_errors(result.project))
    end
  end
end
