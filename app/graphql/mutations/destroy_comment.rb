module Mutations
  class DestroyComment < BaseMutation
    argument :id, ID, required: true

    type Types::Payloads::CommentPayload

    def resolve(id:)
      comment = Comment.find(id)

      result = Comments::Destroy.call(comment: comment)

      result.to_h.merge(errors: formatted_errors(result.comment))
    end
  end
end
