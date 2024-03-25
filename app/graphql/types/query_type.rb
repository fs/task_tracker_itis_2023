# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :project, resolver: Resolvers::Project
    field :projects, resolver: Resolvers::Projects
    field :task, resolver: Resolvers::Task
    field :tasks, resolver: Resolvers::Tasks
    field :comment, resolver: Resolvers::Comment
    field :comments, resolver: Resolvers::Comments
  end
end
