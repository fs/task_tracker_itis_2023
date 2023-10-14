class Task < ApplicationRecord
  belongs_to :project
  validates :name, presence: true
  validates :name, uniqueness: { scope: :project_id }
  validates :status, inclusion: { in: %w[unstarted started done] }
  validate :deadline_check

  private

  def deadline_check
    return unless deadline.present? && deadline < Time.current.to_date

    errors.add(:deadline, "can't be earlier than the current date")
  end
end
