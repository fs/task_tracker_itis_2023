class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy

  validates_associated :tasks
  validates :name, :description, presence: true
end
