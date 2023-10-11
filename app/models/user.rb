class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be in the format someone@example.com" }
  validates :first_name, :last_name, presence: true
  validates :password, length: {minimum: 6, allow_nil: false}
end
