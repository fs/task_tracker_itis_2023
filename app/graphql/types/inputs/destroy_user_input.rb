module Types
  module Inputs
    class DestroyUserInput < Types::BaseInputObject
      argument :id, ID, required: true
    end
  end
end
