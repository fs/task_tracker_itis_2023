# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :task, resolver: Resolvers::Task
    field :tasks, resolver: Resolvers::Tasks
    field :project, resolver: Resolvers::Project
    field :projects, resolver: Resolvers::Projects
  end
end
