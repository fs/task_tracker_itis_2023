class Task < ApplicationRecord
  belongs_to :project
  validates :status, inclusion: { in: ["unstarted", "started", "done"]}
end
