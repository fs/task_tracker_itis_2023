module Mutations
  class DestroyProject < BaseMutation
    argument :input, Types::Inputs::DestroyProjectInput, required: true

    type Types::Payloads::ProjectPayload

    def resolve(input:)
      @project = Project.find(input.id)

      result = ::Projects::Destroy.call(project: @project)
      result.to_h.merge(errors: formatted_errors(result.project))
    end
  end
end
