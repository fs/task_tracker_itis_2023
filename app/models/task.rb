class Task < ApplicationRecord
  belongs_to :project

  validates :name, presence: true
  validates :status, inclusion: { in: %w[unstarted started done] }
  validate :deadline_correct

  private

  def deadline_correct
    return if (created_at || Time.current) < deadline_at

    errors.add(:deadline_at, "must be after creation time")
  end
end
