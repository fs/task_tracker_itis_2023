class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "has an invalid format" }
  validates :first_name, :last_name, presence: true
  validates :password, length: { minimum: 6 }, on: :create
end
