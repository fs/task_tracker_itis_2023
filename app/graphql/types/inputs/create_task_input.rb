module Types
  module Inputs
    class CreateTaskInput < Types::BaseInputObject
      argument :project_id, ID, required: true
      argument :name, String, required: true
      argument :description, String, required: false
      argument :status, TaskStatusType, required: false
      argument :deadline_at, GraphQL::Types::ISO8601DateTime, required: false
    end
  end
end
