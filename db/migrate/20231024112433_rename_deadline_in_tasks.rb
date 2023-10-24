# frozen_string_literal: true

class RenameDeadlineInTasks < ActiveRecord::Migration[6.1]
  def change
    rename_column :tasks, :deadline, :deadline_at
  end
end
