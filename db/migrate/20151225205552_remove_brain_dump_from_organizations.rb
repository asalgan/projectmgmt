class RemoveBrainDumpFromOrganizations < ActiveRecord::Migration
  def change
    remove_column :organizations, :brain_dump, :text
  end
end
