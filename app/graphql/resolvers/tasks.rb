module Resolvers
  class Tasks < Resolvers::Base
    type [Types::TaskType], null: false

    def resolve(**options)
      ::Task.all
    end
  end
end
