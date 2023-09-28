class AddTaskIdToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :task_id, :bigint, primary_key: true
    add_index :tasks, :task_id, unique: true
  end
end
