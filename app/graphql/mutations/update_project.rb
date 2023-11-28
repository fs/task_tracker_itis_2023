module Mutations
  class UpdateProject < BaseMutation
    argument :input, Types::Inputs::UpdateProjectInput, required: true

    type Types::Payloads::CreateProjectPayload

    def resolve(input:)
      result = Projects::Update.call(project: ::Project.find_by(id: input.id), project_params: input.to_h, user: current_user)

      result.to_h.merge(errors: formatted_errors(result.project))
    end
  end
end
