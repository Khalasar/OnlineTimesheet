class TimesheetsController < ApplicationController
  def new
    date = Date.today
    @timesheet = Timesheets.new({month: date.month, year: date.year})
  end

  def index
    @timesheets = current_user.timesheets
    @act_timesheet = Timesheets.find_by_month(Date.today.month)
    if @act_timesheet

    else
      flash.now.alert = "Bitte fügen Sie einen neuen Stundenzettel hinzu."
      render "new"
    end
  end

end
