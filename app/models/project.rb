class Project < ApplicationRecord
  validates :name, :description, presence: true
  has_many :tasks, dependent: :destroy
end
