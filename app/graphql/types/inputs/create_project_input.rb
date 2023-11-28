module Types
  module Inputs
    class CreateProjectInput < Types::BaseInputObject
      argument :name, String, required: true
      argument :description, String, required: false
    end
  end
end
