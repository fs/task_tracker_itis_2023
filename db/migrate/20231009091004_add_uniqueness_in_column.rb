class AddUniquenessInColumn < ActiveRecord::Migration[6.1]
  def change
    add_index :tasks, :title, unique: true
    add_index :projects, :name, unique: true
  end
end
