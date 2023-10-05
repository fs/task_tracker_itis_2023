class Task < ApplicationRecord

  #enum :state {Just started:0, In Progress:1, Finished:2}
  belongs_to :project

  validates :task_title, :task_description, :state, :deadline, :project_id, presence: true
end
