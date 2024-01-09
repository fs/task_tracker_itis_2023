module Mutations
  class DestroyProject < BaseMutation
    argument :id, ID, required: true

    type Types::Payloads::ProjectPayload

    def resolve(id:)
      project = Project.find(id)

      result = ::Projects::Destroy.call(project: project)
      result.to_h.merge(errors: formatted_errors(result.project))
    end
  end
end
