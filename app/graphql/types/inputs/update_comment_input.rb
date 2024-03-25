module Types
  module Inputs
    class UpdateCommentInput < Types::BaseInputObject
      argument :id, ID, required: true
      argument :content, String, required: false
    end
  end
end
