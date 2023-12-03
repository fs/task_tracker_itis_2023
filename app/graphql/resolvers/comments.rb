module Resolvers

  class Comments < Resolvers::Base
    type [Types::CommentType], null: true

    def resolve(**_args)
      ::Comment.all
    end
  end
end