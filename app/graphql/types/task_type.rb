module Types
  class TaskType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :description, String
    field :deadline_at, GraphQL::Types::ISO8601DateTime
    field :project_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :status, TaskStatusType, null: false
    field :project, ProjectType, null: false
  end
end
