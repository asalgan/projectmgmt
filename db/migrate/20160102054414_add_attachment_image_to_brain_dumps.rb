class AddAttachmentImageToBrainDumps < ActiveRecord::Migration
  def self.up
    change_table :brain_dumps do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :brain_dumps, :image
  end
end
