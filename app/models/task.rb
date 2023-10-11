class Task < ApplicationRecord

  belongs_to :project

  validates :task_title, :task_description, :state, :deadline, :project_id, presence: true
  validate :deadline_correct
  validates :task_title, uniqueness: {scope: :project_id, message: "Must be unique within the project!"}
  # validate :unique_name_within_project

  private
  def deadline_correct
    return if (created_at || Time.current) < deadline

    errors.add(:deadline_at, "must be after creation time")
  end
end
