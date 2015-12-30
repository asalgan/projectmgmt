class OrganizationsController < ApplicationController
  before_filter :can_access, only: [:show]
  before_filter :set_data, only: [:show, :map]

  def index
  end

  def show
  end

  def map
  end


  private

    def can_access
      @organization = Organization.find(params[:id])

      unless @organization.member?(current_user)
        redirect_to organizations_index_path
      end
    end

    def set_data
      @organization = Organization.find(params[:id])
      @brain_dump = @organization.brain_dumps.where(brain_dump_category_id: nil).reverse
      @brain_dump_categories = @organization.brain_dump_categories.includes(:brain_dumps => [:brain_dump_notes])
    end


end
