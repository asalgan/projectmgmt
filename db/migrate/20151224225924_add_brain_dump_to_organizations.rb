class AddBrainDumpToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :brain_dump, :text
  end
end
