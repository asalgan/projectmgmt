class Organization < ActiveRecord::Base
  serialize :brain_dump, Array

  has_many :users, through: :organization_members
  has_many :organization_members

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
