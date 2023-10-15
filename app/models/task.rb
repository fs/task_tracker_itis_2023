class Task < ApplicationRecord
  belongs_to :project

  validates :name, presence: true
  validate :deadline_is_correct?
  def deadline_is_correct?
    if deadline_at.to_i < Time.current.to_i
      errors.add(:deadline, 'must be a valid deadline')
    end
  end

end
