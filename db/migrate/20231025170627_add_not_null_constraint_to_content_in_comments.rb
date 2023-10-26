class AddNotNullConstraintToContentInComments < ActiveRecord::Migration[6.1]
  def change
    change_column :comments, :content, :text, null: false
  end
end
