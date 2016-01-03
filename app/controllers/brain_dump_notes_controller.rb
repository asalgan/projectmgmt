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
    @note = BrainDumpNote.create(brain_dump_note_params)

    #   respond_to do |format|
    #     if @note.save!
    #       format.html { redirect_to map_organization_path(@note.brain_dump.organization) }
    #     else
    #       format.html { redirect_to map_organization_path(@note.brain_dump.organization) }
    #     end
    #   end

    if params[:brain_dump_note][:upload].present?
      render 'file.js', formats: [:js]
    else
      render 'show.js', formats: [:html]
    end

  end

  private

    def brain_dump_note_params
      params.require(:brain_dump_note).permit(:body, :user_id, :brain_dump_id, :upload)
    end


end
