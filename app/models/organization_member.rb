class OrganizationMember < ActiveRecord::Base
  belongs_to :user
  belongs_to :organization

  enum role: [:admin, :member]
end
