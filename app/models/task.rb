class Task < ApplicationRecord
  belongs_to :project
  validate :deadline_cannot_be_in_past

  def deadline_cannot_be_in_past
    if deadline.present? && deadline < Date.today
      errors.add(:deadline, "cannot be in the past")
    end
  end
end
