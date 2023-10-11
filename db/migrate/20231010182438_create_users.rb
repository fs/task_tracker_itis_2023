class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    enable_extension "citext"

    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.citext :email, null: false, index: { unique: true }
      t.string :password_digest

      t.timestamps
    end
  end
end
