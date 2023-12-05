module Mutations
  class UpdateComment < BaseMutation
    argument :input, Types::Inputs::UpdateCommentInput, required: true

    type Types::Payloads::CommentPayload

    def resolve(input:)
      input_params = input.to_h
      
      binding.pry
      
      result = Comments::Update.call(comment: Comment.find(input_params.delete(:id)), comment_params: input_params)
      result.to_h.merge(errors: formatted_errors(result.comment))
    end
  end
end