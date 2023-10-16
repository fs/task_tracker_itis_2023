class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9._-]+@[a-zA-Z]+.[a-zA-Z]+\z/,
                                                                message: "incorrect email" }
  validates :first_name, :last_name, presence: true
  validates :password, length: { minimum: 6 }
end
