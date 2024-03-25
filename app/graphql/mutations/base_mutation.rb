# frozen_string_literal: true

module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    include GraphqlErrors
    include ActionPolicy::GraphQL::Behaviour

    argument_class Types::BaseArgument
    field_class Types::BaseField
    object_class Types::BaseObject

    def current_user
      context[:current_user]
    end
  end
end
