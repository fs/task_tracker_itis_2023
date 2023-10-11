class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true

  validates :password, length: { minimum: 6 }, on: :create
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "has an invalid format" }
end
