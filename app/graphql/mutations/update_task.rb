module Mutations
  class UpdateTask < BaseMutation
    argument :input, Types::Inputs::UpdateTaskInput, required: true

    type Types::Payloads::TaskPayload

    def resolve(input:)
      project = ::Project.find_by(id: input.to_h.delete(:project_id))

      result = ::Tasks::Update.call(
        task: project.tasks.find_by(id: input.to_h.delete(:id)),
        task_params: input.to_h, user: current_user
      )

      result.to_h.merge(errors: formatted_errors(result.task))
    end
  end
end
