class TimesheetsController < ApplicationController
  before_filter :require_login

  def new
    date = Date.today
    @timesheet = current_user.timesheets.build(:month => date.month, :year => date.year)
    if @timesheet.save
      redirect_to timesheets_path, notice: "Ein neuer Stundenzettel wurde erstellt."
    else
      render "new"
    end
  end

  def index
    @timesheets = current_user.timesheets
  end

  def show
    @timesheet = current_user.timesheets.find(params[:id])
    @entries = @timesheet.entries
  end

  def create 
    date = Date.today
    @timesheet = current_user.timesheets.build(:month => date.month, :year => date.year)
    if @timesheet.save
      redirect_to timesheets_path, notice: "Ein neuer Stundenzettel wurde erstellt."
    else
      render "new"
    end
  end

  def destroy
    @timesheet = current_user.timesheets.find(params[:id])
    @timesheet.destroy
    redirect_to timesheets_url, notice: "Der Stundenzettel wurde gelöscht."
  end


  def require_login
    unless user_signed_in?
      redirect_to login_path,
      notice: "Bitte loggen Sie sich ein."
    end
  end

  def update
    @timesheet = current_user.timesheets.find(params[:id])
    now = Time.zone.now.utc
    @entry = @timesheet.entries.create(:day => now.to_date, :come => now)
    redirect_to timesheet_path
  end

end