module Types
  module Inputs
    class CreateTaskInput < Types::BaseInputObject
      argument :project_id, ID, required: true
      argument :name, String, required: true
      argument :description, String, required: true
      argument :status, TaskStatusType, required: true
      argument :deadline_at, GraphQL::Types::ISO8601DateTime, required: true
    end
  end
end
