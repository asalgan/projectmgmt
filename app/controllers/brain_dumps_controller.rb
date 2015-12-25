class BrainDumpsController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
    @brain_dump_items = params[:brain_dump][:word].split(/,/).map(&:strip)
    @brain_dump = []

    ActiveRecord::Base.transaction do
      @brain_dump_items.each do |item|
        @item = BrainDump.new(brain_dump_params)
        @item.word = item
        @item.organization_id = params[:brain_dump][:organization_id]
        @item.save!
        @brain_dump << @item
      end
    end

    respond_to do |format|
      format.js { render action: 'show', status: :created, brain_dump: @brain_dump }
    end

  end

  private

    def brain_dump_params
      params.require(:brain_dump).permit(:word, :organization_id, :done, :brain_dump_category_id)
    end


end
