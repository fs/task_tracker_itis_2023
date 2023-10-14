class RemoveTaskId < ActiveRecord::Migration[6.1]
  def change
    remove_column :tasks, :task_id, :bigint
  end
end
