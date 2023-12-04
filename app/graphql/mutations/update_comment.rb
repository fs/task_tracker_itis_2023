module Mutations

  class UpdateComment < BaseMutation
    argument :input, Types::Inputs::UpdateCommentInput, required: true

    type Types::Payloads::CommentPayload

    def resolve(input:)
      input_params = input.to_h
      @comment = Comment.find(input.id)

      result = Comments::Update.call(
        comment_params: input_params,
        comment: @comment
      )

      result.to_h.merge(errors: formatted_errors(result.comment))
    end
  end
end
