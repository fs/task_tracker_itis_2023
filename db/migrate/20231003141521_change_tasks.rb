class ChangeTasks < ActiveRecord::Migration[6.1]
  def change
    change_table :tasks do |t|
      t.rename :deadline, :deadline_at
    end
  end
end
