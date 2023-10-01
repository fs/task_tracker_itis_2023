class Task < ApplicationRecord
  belongs_to :project
  validates :name, :description, :deadline, :project_id, presence: true
  validate :deadline_check

  def deadline_check
    if deadline.present? && deadline < Time.current.to_date
      errors.add(:deadline, "can't be made before the creation date")
    end
  end
end
