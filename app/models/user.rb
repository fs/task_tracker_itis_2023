class User < ApplicationRecord
  extend Enumerize

  has_secure_password

  has_many :project_memberships, dependent: :restrict_with_error
  has_many :projects, through: :project_memberships
  has_many :comments
  
  validates :email, presence: true, uniqueness: true, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :password, length: {minimum: 6}
end
