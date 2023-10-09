class AddUniquenessInColumn < ActiveRecord::Migration[6.1]
  def change
    add_index :tasks, :title
    add_index :projects, :name
  end
end
