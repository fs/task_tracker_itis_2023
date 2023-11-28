module Types
  module Payloads
    class UpdateProjectPayload < Types::BaseObject
      field :project, ProjectType, null: true
      field :errors, [Types::UserError], null: true
    end
  end
end
