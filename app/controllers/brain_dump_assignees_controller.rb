class BrainDumpAssigneesController < ApplicationController

  def new
  end

  def create
    @brain_dump_assignment = BrainDumpAssignee.create(brain_dump_id: params[:brain_dump_id], user_id: params[:user_id])
    render nothing: true
  end

end
