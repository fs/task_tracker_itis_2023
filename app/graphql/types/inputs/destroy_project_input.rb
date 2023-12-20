module Types
  module Inputs
    class DestroyProjectInput < Types::BaseInputObject
      argument :id, ID, required: true
    end
  end
end
