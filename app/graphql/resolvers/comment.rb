module Resolvers

  class Comment < Resolvers::Base
    argument :id, ID, required: true
    type Types::CommentType, null: true

    def resolve(**args)
      ::Comment.find_by(id: args[:id])
    end
  end
end
