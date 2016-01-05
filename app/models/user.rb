class User < ActiveRecord::Base
  has_one :organization_member
  has_many :brain_dump_notes
  has_many :brain_dump_assignees
  has_many :brain_dumps, through: :brain_dump_assignees

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def name
    first_name + " " + last_name
  end

  def organization
    organization_member.organization
  end

  def org_role
    organization_member.role
  end

  def brain_dump_assignments
    brain_dumps
  end

end
