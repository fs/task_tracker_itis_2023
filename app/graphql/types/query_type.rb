# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :project, resolver: Resolvers::Project
    field :projects, resolver: Resolvers::Projects
    field :tasks_by_project_id, resolver: Resolvers::TasksByProjectId
    field :tasks, resolver: Resolvers::Tasks
  end
end
