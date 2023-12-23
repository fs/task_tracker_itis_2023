module Types
  module Inputs
    class UpdateCommentInput < Types::BaseInputObject
      argument :id, ID, required: true
      argument :content, String, required: true
    end
  end
end
