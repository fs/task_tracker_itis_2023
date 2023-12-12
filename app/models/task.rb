class Task < ApplicationRecord
  extend Enumerize
  belongs_to :project

  validates :name, presence: true
  validates :name, uniqueness: { scope: :project_id }
  enumerize :status, in: %i[not_started started finished], default: :not_started
  validate :deadline_correct
  has_many :comments, dependent: :destroy

  private

  def deadline_correct
    return if (created_at || Time.current) < deadline_at

    errors.add(:deadline_at, "must be after creation time")
  end
end
