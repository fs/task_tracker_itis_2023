class Task < ApplicationRecord
  belongs_to :project
  validates :name, :description, :status, :deadline, presence: true
end