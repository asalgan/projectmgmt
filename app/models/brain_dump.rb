class BrainDump < ActiveRecord::Base
  belongs_to :brain_dump_category
  belongs_to :organization
end
