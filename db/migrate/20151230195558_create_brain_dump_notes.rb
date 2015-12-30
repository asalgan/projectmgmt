class CreateBrainDumpNotes < ActiveRecord::Migration
  def change
    create_table :brain_dump_notes do |t|
      t.text :body
      t.references :brain_dump, index: true
      t.references :user, index: true
      t.text :body_html

      t.timestamps
    end
  end
end
