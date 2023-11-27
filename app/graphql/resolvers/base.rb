module Resolvers
  class Base < GraphQL::Schema::Resolver
    argument_class Types::BaseArgument
  end
end
