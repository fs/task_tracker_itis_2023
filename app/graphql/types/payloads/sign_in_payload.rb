module Types
  module Payloads
    class SignInPayload < Types::BaseObject
      field :access_token, String, null: true
      field :errors, [Types::UserError], null: true
    end
  end
end
