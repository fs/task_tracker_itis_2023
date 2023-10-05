class AddUniqueIndexToTasksTitle < ActiveRecord::Migration[6.1]
  def change
    add_index :tasks, [:task_title, :project_id], unique: true
  end
end
