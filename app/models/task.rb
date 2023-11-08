class Task < ApplicationRecord
  extend Enumerize

  STATUSES = ["not started", "started", "finished"].freeze
  belongs_to :project
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: { scope: :project_id }
  validates :status, inclusion: { in: ["not started", "started", "finished"] }
  validate :deadline_correct

  enumerize :status, in: STATUSES, default: "not started"

  private

  def deadline_correct
    return if (created_at || Time.current) < deadline_at

    errors.add(:deadline_at, "must be after creation time")
  end
end
