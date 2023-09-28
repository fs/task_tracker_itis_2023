class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.string :state
      t.datetime :deadline
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
