class Task < ApplicationRecord
  belongs_to :project
  validates_associated :project
  validates :title, :description, :state, :deadline_at, presence: true
  validates :state, inclusion: { in: %w[unstarted started done] }
  validate :deadline_correct

  private

  def deadline_correct
    return if (created_at || Time.current) < deadline_at

    errors.add(:deadline_at, "must be after creation time")
  end
end
