module Resolvers
  class Task < Resolvers::Base
    argument :id, ID, required: true

    type Types::TaskType, null: true

    def resolve(**options)
      ::Task.find_by(id: options[:id])
    end
  end
end
