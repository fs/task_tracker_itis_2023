class Project < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :description, presence: true
  has_many :tasks, dependent: :destroy
end
