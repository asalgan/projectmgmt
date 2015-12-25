class BrainDumpCategoriesController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
    @brain_dump_category_items = params[:brain_dump_category][:name].split(/,/).map(&:strip)
    @brain_dump_categories = []

    ActiveRecord::Base.transaction do
      @brain_dump_category_items.each do |item|
        @item = BrainDumpCategory.new(brain_dump_category_params)
        @item.name = item
        @item.organization_id = params[:brain_dump_category][:organization_id]
        @item.save!
        @brain_dump_categories << @item
      end
    end

    respond_to do |format|
      format.js { render action: 'show', status: :created, brain_dump_categories: @brain_dump_categories }
    end
  end

  private

    def brain_dump_category_params
      params.require(:brain_dump_category).permit(:name, :organization_id, :done)
    end


end
