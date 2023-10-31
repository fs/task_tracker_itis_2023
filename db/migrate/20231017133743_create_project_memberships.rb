class CreateProjectMemberships < ActiveRecord::Migration[6.1]
  def change
    create_table :project_memberships do |t|
      t.references :project, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.string :role, null: false

      t.timestamps
    end
  end
end
