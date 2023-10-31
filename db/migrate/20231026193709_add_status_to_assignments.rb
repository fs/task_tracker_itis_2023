class AddStatusToAssignments < ActiveRecord::Migration[6.1]
  def change
    add_column :assignments, :status, :string, default: 'Not started'
  end
end
