class BrainDump < ActiveRecord::Base
  belongs_to :brain_dump_category
  belongs_to :organization

  has_many :brain_dump_notes


  has_attached_file :image, :styles => { :medium => "300x300>",:thumb => "100x100>" }
  has_attached_file :file, :styles => { :medium => "300x300>",:thumb => "100x100>" }

  validates_attachment :image,
                        content_type: { content_type: ["image/jpeg", "image/gif", "image/png", "image/jpg"] },
                        size: { less_than: 2.megabytes }

end
