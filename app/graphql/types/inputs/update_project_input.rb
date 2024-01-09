module Types
  module Inputs
    class UpdateProjectInput < Types::BaseInputObject
      argument :id, ID, required: true
      argument :name, String, required: true
      argument :description, String, required: false
    end
  end
end
