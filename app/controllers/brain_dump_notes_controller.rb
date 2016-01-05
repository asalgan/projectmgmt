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

    if params[:brain_dump_note][:upload].present?
      if @note.save!
        respond_to do |format|
          format.html
          format.js { render 'show', content_type: 'text/javascript' }
          format.json { render 'show', content_type: 'application/json' }
          # format.js { render layout: false, content_type: 'text/javascript' }
          # render 'file.js', formats: [:js]
        end
      end
    else
      if @note.save!
        respond_to do |format|
          format.js { render 'show', content_type: 'text/javascript' }
        end
      end
    end

  end

  private

    def brain_dump_note_params
      params.require(:brain_dump_note).permit(:body, :user_id, :brain_dump_id, :upload)
    end


end
