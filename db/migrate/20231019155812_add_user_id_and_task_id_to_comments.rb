class AddUserIdAndTaskIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :user, null: false, foreign_key: true
    add_reference :comments, :task, null: false, foreign_key: true
  end
end
