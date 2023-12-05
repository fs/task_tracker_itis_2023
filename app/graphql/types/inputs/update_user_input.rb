module Types
  module Inputs
    class UpdateUserInput < Types::BaseInputObject
      argument :first_name, String, required: false
      argument :last_name, String, required: false
      argument :email, String, required: false
      argument :role, UserRoleType, required: false
    end
  end
end
