module Resolvers
  class TasksByProjectId < Resolvers::Base
    argument :project_id, Integer, required: true

    type [Types::TaskType], null: true

    def resolve(**options)
      ::Project.find_by(id: options[:project_id]).tasks
    end
  end
end
