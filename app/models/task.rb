class Task < ApplicationRecord
  extend Enumerize
  belongs_to :project

  enumerize :status, in: %i[not_started started finished], default: :not_started
  validates :name, presence: true
  validates :name, uniqueness: { scope: :project_id }
  validates :status, inclusion: { in: %w[unstarted started done] }
  validate :deadline_correct

  private

  def deadline_correct
    return if (created_at || Time.current) < deadline_at

    errors.add(:deadline_at, "must be after creation time")
  end
end
