class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :project_memberships, dependent: :destroy
  has_many :users, through: :project_memberships

  validates :name, :description, presence: true
  validates :name, uniqueness: true
end