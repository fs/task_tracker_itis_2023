module Types
  class MutationType < Types::BaseObject
    field :create_project, mutation: Mutations::CreateProject
    field :update_project, mutation: Mutations::UpdateProject
    field :update_task, mutation: Mutations::UpdateTask
    field :destroy_project, mutation: Mutations::DestroyProject
  end
end
