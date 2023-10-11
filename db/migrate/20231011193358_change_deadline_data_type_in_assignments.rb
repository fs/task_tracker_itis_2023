class ChangeDeadlineDataTypeInAssignments < ActiveRecord::Migration[6.1]
  def change
    change_column :assignments, :deadline, :datetime
  end
end
