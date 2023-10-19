class AddUniqueConstraintToTasks < ActiveRecord::Migration[6.1]
  def change
    add_index :tasks, :name, unique: true
  end
end
