class EntriesController < ApplicationController

  def update
    @entry = Entry.find(params[:id])
    now = Time.zone.now.utc
    @entry.gone=  now

    if @entry.save
      flash[:notice] = 'Erfolgreich gespeichert'
    else
      flash[:alert] = 'Konnte nicht gespeichert werden'
    end

    timesheet = Timesheet.find(params[:timesheet_id])
    
    redirect_to timesheet_path(timesheet)
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    timesheet = Timesheet.find(params[:timesheet_id])
    
    redirect_to timesheet_path(timesheet), notice: "Der Eintrag wurde gelöscht."
  end

end
