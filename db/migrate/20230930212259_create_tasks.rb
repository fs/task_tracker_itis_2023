class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.text :state
      t.datetime :deadline
      t.string :text
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
