module Resolvers
  class Task < Resolvers::Base
    argument :project_id, ID, required: true
    argument :id, ID, required: true

    type Types::TaskType, null: true

    def resolve(**options)
      ::Project.find_by(id: _options[:project_id]).tasks.find_by(id: options[:task_id])
    end
  end
end
