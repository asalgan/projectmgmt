class BrainDump < ActiveRecord::Base
  belongs_to :brain_dump_category
  belongs_to :organization
  has_many :brain_dump_assignees
  has_many :users, through: :brain_dump_assignees
  has_many :brain_dump_notes

  validates :word, presence: true
  validates :organization_id, presence: true

  def assignees
    users
  end

  def due_date_in_future?
    if (due_date.present? && due_date > Date.today)
      (due_date - Date.today).to_i
    else
      "-"
    end
  end

end
