module Types
  class MutationType < Types::BaseObject
    field :sign_up, mutation: Mutations::SignUp
    field :sign_in, mutation: Mutations::SignIn

    field :create_project, mutation: Mutations::CreateProject
    field :update_project, mutation: Mutations::UpdateProject
    field :destroy_project, mutation: Mutations::DestroyProject

    field :create_task, mutation: Mutations::CreateTask 
    field :update_task, mutation: Mutations::UpdateTask 

    field :destroy_user, mutation: Mutations::DestroyUser
    field :update_user, mutation: Mutations::UpdateUser

    field :create_comment, mutation: Mutations::CreateComment
    field :update_comment, mutation: Mutations::UpdateComment
  end
end
