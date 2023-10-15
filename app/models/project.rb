class Project < ApplicationRecord
  validates :name, :description, presence: true, uniqueness: true
  has_many :tasks, dependent: :destroy
end
