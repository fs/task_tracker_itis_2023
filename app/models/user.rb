class User < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  validates_length_of :password, minimum: 6
end
