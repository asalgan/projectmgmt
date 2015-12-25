class CreateBrainDumpCategories < ActiveRecord::Migration
  def change
    create_table :brain_dump_categories do |t|
      t.string :name
      t.references :organization, index: true
      t.boolean :done

      t.timestamps
    end
  end
end
