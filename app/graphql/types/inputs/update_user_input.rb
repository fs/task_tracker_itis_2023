module Types
  module Inputs
    class UpdateUserInput < Types::BaseInputObject
      argument :id, ID, required: true
      argument :first_name, String, required: false
      argument :last_name, String, required: false
      argument :email, String, required: false
    end
  end
end
