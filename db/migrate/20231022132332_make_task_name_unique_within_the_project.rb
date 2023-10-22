class MakeTaskNameUniqueWithinTheProject < ActiveRecord::Migration[6.1]
  def change
    add_index :tasks, [:name, :project_id], unique: true 
  end
end
