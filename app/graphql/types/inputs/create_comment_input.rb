module Types
  module Inputs
    class CreateCommentInput < Types::BaseInputObject
      argument :task_id, ID, required: true
      argument :content, String, required: false
    end
  end
end
