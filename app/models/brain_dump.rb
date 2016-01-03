class BrainDump < ActiveRecord::Base
  belongs_to :brain_dump_category
  belongs_to :organization

  has_many :brain_dump_notes

end
