class Task < ApplicationRecord
  belongs_to :project
  validates :name, :description, :status, presence: true
  validate :deadline_not_in_past

  def deadline_not_in_past
    if deadline <= Date.today
      errors.add(:deadline, "неверный ")
    end
  end


end