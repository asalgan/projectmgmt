class OrganizationsController < ApplicationController
  before_filter :can_access, only: [:show]

  def index
  end

  def show
    @organization = Organization.find(params[:id])
    @brain_dump = @organization.brain_dumps.where(brain_dump_category_id: nil).reverse
    @brain_dump_categories = @organization.brain_dump_categories
  end


  private

    def can_access
      @organization = Organization.find(params[:id])

      unless @organization.member?(current_user)
        redirect_to organizations_index_path
      end
    end


end
