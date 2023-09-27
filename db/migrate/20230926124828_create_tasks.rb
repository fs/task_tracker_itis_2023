class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :task_title
      t.text :task_description
      t.string :state
      t.date :deadline

      t.timestamps
    end
  end
end
