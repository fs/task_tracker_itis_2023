class CreateAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :assignments do |t|
      t.string :assignment_name
      t.string :description
      t.date :deadline
      t.boolean :completion_status

      t.timestamps
    end
  end
end
