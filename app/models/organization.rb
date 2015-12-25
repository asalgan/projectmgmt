class Organization < ActiveRecord::Base
  has_many :users, through: :organization_members
  has_many :organization_members

  has_many :brain_dumps
  has_many :brain_dump_categories

  enum org_type: [:business, :nonprofit, :civic]

  def members
    users
  end

  def member?(user)
    members.include?(user)
  end

  def admin
    organization_members.find_by_role(0).user
  end

end
