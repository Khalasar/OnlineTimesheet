class Entry < ActiveRecord::Base
  attr_accessible :come, :day, :gone, :timesheet_id
  belongs_to :timesheets

end
