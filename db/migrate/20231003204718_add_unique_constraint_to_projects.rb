class AddUniqueConstraintToProjects < ActiveRecord::Migration[6.1]
  def change
    unless index_exists?(:projects, :name)
      add_index :projects, :name, unique: true
    end
  end
end
