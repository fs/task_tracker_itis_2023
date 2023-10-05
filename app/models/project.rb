class Project < ApplicationRecord
  validates :name, :description, presence: true
  validates :name, uniqueness: true
  has_many :tasks, dependent: :destroy

end