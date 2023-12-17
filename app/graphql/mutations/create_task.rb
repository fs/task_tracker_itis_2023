module Mutations
    class CreateTask < BaseMutation
      argument :input, Types::Inputs::CreateTaskInput, required: true
  
      type Types::Payloads::TaskPayload
  
      def resolve(input:)
        input_params = input.to_h
        project = Project.find(input_params.delete(:project_id))
        result = Tasks::Create.call(task_params: input_params, project: project)
        result.to_h.merge(errors: formatted_errors(result.task))
      end
    end
  end