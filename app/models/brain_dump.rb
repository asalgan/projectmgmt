class BrainDump < ActiveRecord::Base
  belongs_to :brain_dump_category
  belongs_to :organization
  has_many :brain_dump_assignees
  has_many :users, through: :brain_dump_assignees
  has_many :brain_dump_notes

  def assignees
    users
  end

end
