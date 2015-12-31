class BrainDumpNotesController < ApplicationController

  def index
  end

  def show
  end

  def new
    # @note = BrainDumpNote.new
  end

  def update
  end

  def create
    @note = BrainDumpNote.new(brain_dump_note_params)

    respond_to do |format|
      if @note.save
        # format.html { redirect_to map_organization_path(@note.brain_dump.organization) }
        format.js { render action: 'show', locals: { note: @note } }
      else
        format.html { redirect_to map_organization_path(@note.brain_dump.organization) }
      end
    end
  end

  private

    def brain_dump_note_params
      params.require(:brain_dump_note).permit(:body, :user_id, :brain_dump_id)
    end


end
