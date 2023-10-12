class AddUniquenessToAssignments < ActiveRecord::Migration[6.1]
  def change
    add_index :assignments, [:assignment_name, :project_id], unique: true
  end
end
