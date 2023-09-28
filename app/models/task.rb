class Task < ApplicationRecord
  belongs_to :project
  validates :title, :description, :state, :deadline, presence: true
end
