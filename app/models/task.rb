# frozen_string_literal: true

class Task < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :project_id, message: 'Name must be unique within the project' }
  validates :description, :status, :deadline_at, presence: true
  belongs_to :project
end
