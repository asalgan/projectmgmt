class CreateBrainDumpAssignees < ActiveRecord::Migration
  def change
    create_table :brain_dump_assignees do |t|
      t.references :user, index: true
      t.references :brain_dump, index: true
    end
  end
end
