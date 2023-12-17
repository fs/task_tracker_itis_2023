module Mutations
    class DeleteProject < BaseMutation
      argument :input, Types::Inputs::DeleteProjectInput, required: true
  
      type Types::Payloads::ProjectPayload
  
      def resolve(input:)
        input_params = input.to_h
        result = Projects::Destroy.call(project: Project.find(input_params.delete(:id)))
  
        result.to_h.merge(errors: formatted_errors(result.project))
      end
    end
  end