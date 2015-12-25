class OrganizationsController < ApplicationController
  before_filter :can_access, only: [:show]

  def index
  end

  def show
    @organization = Organization.find(params[:id])
    @brain_dump = @organization.brain_dump
  end

  private

    def can_access
      @organization = Organization.find(params[:id])

      unless @organization.member?(current_user)
        redirect_to organizations_index_path
      end
    end


end
