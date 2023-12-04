module Types
  module Inputs

    class DestroyTaskInput < Types::BaseInputObject
      argument :id, ID, required: true
      argument :project_id, Integer, required: true
    end
  end
end
