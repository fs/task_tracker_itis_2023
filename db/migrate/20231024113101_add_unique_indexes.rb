# frozen_string_literal: true

class AddUniqueIndexes < ActiveRecord::Migration[6.1]
  def change
    add_index :projects, :name, unique: true
    add_index :tasks, %i[project_id name], unique: true
  end
end
