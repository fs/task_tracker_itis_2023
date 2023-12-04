module Mutations
  class CreateTask < BaseMutation
    argument :input, Types::Inputs::CreateTaskInput, required: true

    type Types::Payloads::TaskPayload

    def resolve(input:)
      result = Tasks::Create.call(
        project: ::Project.find_by(id: input.to_h.delete(:project_id)),
        task_params: input.to_h, user: current_user)

      result.to_h.merge(errors: formatted_errors(result.task))
    end
  end
end
