module Types
  module Payloads
    class CurrentUserType < Types::BaseObject
      field :email, String, null: false
      field :first_name, String, null: true
      field :last_name, String, null: true
    end
  end
end
