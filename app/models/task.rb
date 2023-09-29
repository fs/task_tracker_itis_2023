class Task < ApplicationRecord
  belongs_to :project
  validates :status, inclusion: { in: ["unstarted", "started", "done"]}
  validate :deadline_correct

  private

  def deadline_correct
    if deadline_at && deadline_at < Time.current
      errors.add(:deadline_at, "incorrect deadline")
    end
  end
end
