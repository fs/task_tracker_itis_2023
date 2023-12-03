module Types
  module Inputs

    class DestroyTaskInput < Types::BaseInputObject
      argument :id, ID, required: true
    end
  end
end