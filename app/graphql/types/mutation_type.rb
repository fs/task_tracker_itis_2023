# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :update_project, mutation: Mutations::UpdateProject
    field :create_project, mutation: Mutations::CreateProject
  end
end
