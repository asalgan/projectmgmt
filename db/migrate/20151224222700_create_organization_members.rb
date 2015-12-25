class CreateOrganizationMembers < ActiveRecord::Migration
  def change
    create_table :organization_members do |t|
      t.integer :role
      t.references :user, index: true
      t.references :organization, index: true

      t.timestamps
    end
  end
end
