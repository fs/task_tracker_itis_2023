class ChangeStatusToTasks < ActiveRecord::Migration[6.1]
  def change
    change_column_default :tasks, :status, "not started"
  end
end
