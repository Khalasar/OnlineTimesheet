class Entry < ActiveRecord::Base
  attr_accessible :come, :day, :gone
  belongs_to :timesheets

  def calc_hours
    time_difference = gone.utc - come.utc    
  end
end
