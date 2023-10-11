class AddUniqueConstraintToTasks < ActiveRecord::Migration[6.1]
  def change
    return if index_exists?(:tasks, %i[name project_id])

    add_index :tasks, %i[name project_id], unique: true
  end
end
