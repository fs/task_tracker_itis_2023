module Mutations

  class DestroyTask < BaseMutation
    argument :input, Types::Inputs::DestroyTaskInput, required: true

    type Types::Payloads::TaskPayload

    def resolve(input:)
      @task = Task.find(input.id)
      @project = Project.find(@task.project_id)

      result = ::Tasks::Destroy.call(task: @task, user: current_user).merge(@project)
      result.to_h.merge(errors: formatted_errors(result.project))
    end
  end
end