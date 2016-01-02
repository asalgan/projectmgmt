class AddAttachmentFileToBrainDumps < ActiveRecord::Migration
  def self.up
    change_table :brain_dumps do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :brain_dumps, :file
  end
end
