class CreateBrainDumps < ActiveRecord::Migration
  def change
    create_table :brain_dumps do |t|
      t.string :word
      t.references :brain_dump_category, index: true
      t.references :organization, index: true
      t.boolean :done, default: false

      t.timestamps
    end
  end
end
