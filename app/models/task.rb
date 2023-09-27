class Task < ApplicationRecord

  belongs_to :project

  validates :task_title, :task_description, :state, :deadline, presence: true
end
