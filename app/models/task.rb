class Task < ApplicationRecord
  belongs_to :project
  validates :title, presence: true
  validates :project, presence: true
  validates :deadline, presence: true
  validate :deadline_is_correct
  

  def deadline_is_correct
    if deadline < Date.today
      errors.add(:deadline, "incorrect deadline. try again")
    end
  end

end
