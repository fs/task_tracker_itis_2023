class UniqueProjectName < ActiveRecord::Migration[6.1]
  def change
    add_index :projects, :name, unique: true
  end
end
