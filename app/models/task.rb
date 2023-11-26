class Task < ApplicationRecord
  belongs_to :project
  has_many :comment, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: { scope: :project_id }
  #validates :status, inclusion: { in: %w[unstarted started done] }
  validate :deadline_correct


  extend Enumerize
  enumerize :status, in: [:not_started, :started, :finished], default: :not_started

  private

  def deadline_correct
    return if (created_at || Time.current) < deadline_at

    errors.add(:deadline_at, "must be after creation time")
  end
end
