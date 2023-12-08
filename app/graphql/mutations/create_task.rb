module Mutations
  class CreateTask < BaseMutation
    argument :input, Types::Inputs::CreateTaskInput, required: true
    argument :project_id, ID, required: true

    type Types::Payloads::TaskPayload

    def resolve(input:, project_id:)
      project = Project.find(project_id)
      result = ::Tasks::Create.call(task_params: input.to_h, project: project)

      result.to_h.merge(errors: formatted_errors(result.project))
    end
  end
end
