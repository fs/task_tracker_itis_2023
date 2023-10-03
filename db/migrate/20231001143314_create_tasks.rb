class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.text :name
      t.text :description
      t.text :state
      t.text :deadline
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
