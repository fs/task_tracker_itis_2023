class User < ApplicationRecord
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }
  validates :first_name, :last_name, presence: true
end
