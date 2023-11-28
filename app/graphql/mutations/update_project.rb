module Mutations
  class UpdateProject < BaseMutation
    argument :input, Types::Inputs::UpdateProjectInput, required: true

    type Types::Payloads::UpdateProjectPayload

    def resolve(input:)
      result = Projects::Update.call(project: Project.find_by(id: input.to_h[:id]), project_params: input.to_h)

      result.to_h.merge(errors: formatted_errors(result.project))
    end
  end
end
