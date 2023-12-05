module Types
  class MutationType < Types::BaseObject
    field :create_project, mutation: Mutations::CreateProject
    field :update_project, mutation: Mutations::UpdateProject
    field :destroy_project, mutation: Mutations::DestroyProject
    field :create_task, mutation: Mutations::CreateTask
    field :update_task, mutation: Mutations::UpdateTask
    field :update_comment, mutation: Mutations::UpdateComment
  end
end
