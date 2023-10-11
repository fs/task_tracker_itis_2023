class Task < ApplicationRecord
  belongs_to :project
  validates :name, presence: true
  validates :name, uniqueness: { scope: :project_id }
  validates :status, inclusion: { in: %w[unstarted started done] }
  validate :deadline_correct

  private

  def deadline_correct
    return if (created_at || Time.current) < deadline

    errors.add(:deadline, "must be after creation time")
  end
end
