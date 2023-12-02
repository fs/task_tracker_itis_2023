class Task < ApplicationRecord
  belongs_to :project, required: true
  validates :name, :deadline_at, :description, :project_id, presence: true
  validate :deadline_is_correct
end 


def deadline_is_correct
  if deadline_at < Date.today
    errors.add(:deadline_at, "field is invalid. try again")
  end
end