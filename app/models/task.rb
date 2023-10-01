class Task < ApplicationRecord
  belongs_to :project, required: true
  validates :status, inclusion: { in: ["unstarted", "started", "done"]}
  validate :deadline_correct
  validate :name, presence:true

  private

  def deadline_correct
    return if (created_at || Time.current) < deadline_at
    errors.add(:deadline_at, "must be after creation time")
  end
end
