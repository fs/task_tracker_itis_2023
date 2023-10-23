class AddStatusToTasks < ActiveRecord::Migration[6.1]
  def change
    change_column_default :tasks, :status, from: nil, to: "unstarted"
  end
end
