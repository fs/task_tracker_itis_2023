class User < ApplicationRecord
  extend Enumerize

  has_secure_password
  ROLES = %i[member admin super_admin].freeze
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  has_many :project_memberships, dependent: :restrict_with_error
  has_many :projects, through: :project_memberships
  has_many :comments

  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :first_name, :last_name, presence: true

  enumerize :role, in: ROLES, predicates: true, scope: :shallow, default: :member
end
