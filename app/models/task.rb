class Task < ApplicationRecord

  belongs_to :project

  validates :name, :description, :status, :deadline_at, :project_id, presence: true
  validate :deadline_correct
  validates :name, uniqueness: {scope: :project_id, message: "Must be unique within the project!"}
  # validate :unique_name_within_project

  private
  def deadline_correct
    return if (created_at || Time.current) < deadline_at

    errors.add(:deadline_at, "must be after creation time")
  end
end
