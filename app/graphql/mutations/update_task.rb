module Mutations
  class UpdateTask < BaseMutation
    argument :input, Types::Inputs::UpdateTaskInput, required: true

    type Types::Payloads::TaskPayload

    def resolve(input:)
      input_hash = input.to_h

      result = ::Tasks::Update.call(
        task: Task.find_by(id: input_hash.delete(:id)),
        task_params: input_hash, user: current_user
      )

      result.to_h.merge(errors: formatted_errors(result.task))
    end
  end
end
