class AddProjectToAssignments < ActiveRecord::Migration[6.1]
  def change
    add_reference :assignments, :project, foreign_key: true
  end
end
