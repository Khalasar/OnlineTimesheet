class TimesheetsController < ApplicationController
  def new
    #date = Date.today
    #@timesheet = current_user.timesheets.build({month: date.month, year: date.year})
    @bookmark = current_user.bookmarks.build
  end

  def index
    #@timesheets = current_user.timesheets
    #@act_timesheet = Timesheets.find_by_month(Date.today.month)
    #if @act_timesheet

    #else
    #date = Date.today
    #@act_timesheet = @timesheets.build({month: date.month, year: date.year})
    #end
    @timesheets = current_user.timesheets
  end

  def edit
    @timesheet = current_user.timesheets.find[params[:id]]
  end

  def show
    @timesheet = current_user.timesheets.find(params[:id])
  end

  def create 
    @timesheet = current_user.timesheets.build(params[:timesheet])
    if @timesheet.save
      redirect_to timesheets_path, notice: "Ein neuer Stundenzettel wurde erstellt."
    else
      render "new"
    end
  end

  def update
    @timesheet = current_user.timesheets.find(params[:id])
    if @timesheet.update_attributes(params[:timesheet])
      redirect_to timesheets_path, notice: "Der Stundenzettel wurd geändert."
    else
      render "edit"
    end
  end

  def destroy
    @timesheet = current_user.timesheets.find(params[:id])
    @timesheet.destroy
    redirect_to timesheets_url, notice: "Der Stundenzettel wurde gelöscht."
  end

  #def act_timesheets
  #  @timesheets.each |entry| do
  #    if entry.year == Date.today.year && entry.month == Date.today.month
  #      @act_timesheet = entry
  #    else
  #      render "create"
  #    end
  #  end
  #end

end