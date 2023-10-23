class AddStatusToTasks < ActiveRecord::Migration[6.1]
  def change
    change_column_default :tasks, :status, "unstarted", from: nil, to: "unstarted"
  end
end
