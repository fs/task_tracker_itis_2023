class Task < ApplicationRecord
  #enum :state {Just started:0, In Progress:1, Finished:2}
  #validates :task_title, presence: true
  #validates :status, inclusion: { in: %w[unstarted started done] }
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

  # def unique_name_within_project
  #   existing_task = project.tasks.find_by(task_title: task_title)
  #   if existing_task && existing_task != self
  #     errors.add(:task_title, "must be unique within the project")
  #   end
  # end

end