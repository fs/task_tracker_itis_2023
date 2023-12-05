module Mutations
  class CreateTask < BaseMutation
    argument :input, Types::Inputs::CreateTaskInput, required: true

    type Types::Payloads::TaskPayload

    def resolve(input:)
      input_params = input.to_h

      result = Tasks::Create.call(project: Project.find(input_params.delete(:project_id)), task_params: input_params)

      result.to_h.merge(errors: formatted_errors(result.project))
    end
  end
end
