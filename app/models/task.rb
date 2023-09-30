class Task < ApplicationRecord
  validates :name, :description, :status, :deadline, presence: true
  belongs_to :project
end
