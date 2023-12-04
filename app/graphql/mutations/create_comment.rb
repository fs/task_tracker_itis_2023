module Mutations
  class CreateComment < BaseMutation
    argument :input, Types::Inputs::CreateCommentInput, required: true

    type Types::Payloads::CommentPayload

    def resolve(input:)
      result = Comments::Create.call(comment_params: input.to_h, task: Task.find_by(id: input.to_h[:task_id]), user: current_user)

      result.to_h.merge(errors: formatted_errors(result.comment))
    end
  end
end
