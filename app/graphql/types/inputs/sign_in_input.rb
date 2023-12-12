module Types
  module Inputs
    class SignInInput < Types::BaseInputObject
      argument :email, String, required: true
      argument :password, String, required: true
    end
  end
end
