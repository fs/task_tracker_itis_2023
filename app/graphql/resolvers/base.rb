module Resolvers
  class Base < GraphQL::Schema::Resolver
    argument_class Types::BaseArgument

    def current_user
      @context[:current_user]
    end
  end
end
