module Types
  module Inputs
    class UpdateTaskInput < Types::BaseInputObject
      argument :id, ID, required: true
      argument :name, String, required: true
      argument :description, String, required: false
      argument :status, TaskStatusType, required: false
      argument :deadline_at, GraphQL::Types::ISO8601DateTime, required: false
    end
  end
end
