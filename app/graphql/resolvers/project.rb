module Resolvers
  class Project < Resolvers::Base
    argument :id, ID, required: true

    type Types::ProjectType, null: true

    def resolve(**options)
      ::Project.find_by(id: options[:id])
    end
  end
end
