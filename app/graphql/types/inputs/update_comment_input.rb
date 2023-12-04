module Types
  module Inputs

    class UpdateCommentInput < Types::BaseInputObject
      argument :content, String, required: true
      argument :id, ID, required: true
    end
  end
end
