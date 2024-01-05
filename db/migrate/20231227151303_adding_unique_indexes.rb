class AddingUniqueIndexes < ActiveRecord::Migration[6.1]
    def change
      add_index :projects, :name, unique: true
      add_index :tasks, %i[name project_id], unique: true
    end
  end