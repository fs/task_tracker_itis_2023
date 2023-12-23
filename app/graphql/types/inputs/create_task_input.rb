module Types
  module Inputs
    class CreateTaskInput < Types::BaseInputObject
      argument :name, String, required: true
      argument :description, String, required: false
      argument :deadline_at, GraphQL::Types::ISO8601DateTime, required: true
      argument :project_id, Integer, required: true
      argument :status, TaskStatusType, required: true
    end
  end
end
