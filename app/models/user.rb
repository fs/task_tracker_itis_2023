class User < ApplicationRecord
  has_secure_password

  validates :password, length: { minimum: 6 }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }

end
