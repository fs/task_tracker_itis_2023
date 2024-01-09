module Mutations
  class DestroyTask < BaseMutation
    argument :id, ID, required: true

    type Types::Payloads::TaskPayload

    def resolve(id:)
      task = Task.find(id)

      result = ::Tasks::Destroy.call(task: task, user: current_user)
      result.to_h.merge(errors: formatted_errors(result.task))
    end
  end
end
