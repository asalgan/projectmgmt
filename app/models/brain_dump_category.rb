class BrainDumpCategory < ActiveRecord::Base
  belongs_to :organization
  has_many :brain_dumps
end
