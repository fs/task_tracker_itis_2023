class AddRolesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :role, :string, default: "member", null: false
  end
end
