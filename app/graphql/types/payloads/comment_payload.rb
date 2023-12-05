module Types
  module Payloads
    
    class CommentPayload < Types::BaseObject
      field :comment, CommentType, null: true
      field :errors, [Types::UserError], null: true
    end
  end
end
