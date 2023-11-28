module Resolvers
  class Tasks < Resolvers::Base
    type [Types::TaskType], null: false

    def resolve(**_options)
      ::Task.all
    end
  end
end