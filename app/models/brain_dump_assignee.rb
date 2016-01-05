class BrainDumpAssignee < ActiveRecord::Base

  belongs_to :user
  belongs_to :brain_dump

end
