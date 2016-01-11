class BrainDumpAssignee < ActiveRecord::Base

  belongs_to :user
  belongs_to :brain_dump

  validates :user, presence: true
  validates :brain_dump, presence: true

end
