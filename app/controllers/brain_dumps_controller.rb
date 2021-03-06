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

  def update

    if params[:category_id].to_i > 0
      @brain_dump_category = BrainDumpCategory.find(params[:category_id])
      @brain_dump = BrainDump.find(params[:id])
      @brain_dump.update_attributes(brain_dump_category_id: @brain_dump_category.id)
    else
      @brain_dump = BrainDump.find(params[:id])
      @brain_dump.update_attributes(brain_dump_category_id: nil)
    end

    render nothing: true
  end

  def update_completion
    @brain_dump = BrainDump.find(params[:id])
    is_done = (@brain_dump.done = !@brain_dump.done)
    @brain_dump.update(done: is_done)
    render nothing: true
  end

  def update_due_date
    @brain_dump = BrainDump.find(params[:id])
    date = params[:due_date].to_date
    @brain_dump.update(due_date: date)
    render nothing: true
  end

  def check_done
    @brain_dump = BrainDump.find(params[:id])
    render json: @brain_dump.done.as_json
  end

  private

    def brain_dump_params
      params.require(:brain_dump).permit(:word, :organization_id, :done, :brain_dump_category_id)
    end


end
