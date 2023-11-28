# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_project, mutation: Mutations::CreateProject
    field :project_update, mutation: Mutations::UpdateProject
  end
end
