class AddAttachmentUploadToBrainDumpNotes < ActiveRecord::Migration
  def self.up
    change_table :brain_dump_notes do |t|
      t.attachment :upload
    end
  end

  def self.down
    remove_attachment :brain_dump_notes, :upload
  end
end
