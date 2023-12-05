module Mutations
  class CreateComment < BaseMutation
    argument :input, Types::Inputs::CreateCommentInput, required: true

    type Types::Payloads::CommentPayload

    def resolve(input:)
      hash_input = input.to_h
      task = Task.find_by(id: hash_input.delete(:task_id))
      result = Comments::Create.call(comment_params: hash_input, task: task, user: current_user)

      result.to_h.merge(errors: formatted_errors(result.comment))
    end
  end
end
