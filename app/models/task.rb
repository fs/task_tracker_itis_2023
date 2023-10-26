class Task < ApplicationRecord
  extend Enumerize

  enumerize :status, in: { unstarted: 0, started: 1, finished: 2 }, default: :unstarted, predicates: true
  has_many :comments, dependent: :destroy
  belongs_to :project

  validates :name, presence: true
  validates :name, uniqueness: { scope: :project_id }
  validate :deadline_correct

  private

  def deadline_correct
    return if (created_at || Time.current) < deadline_at

    errors.add(:deadline_at, "must be after creation time")
  end
end
