class Entry < ActiveRecord::Base
  attr_accessible :come, :day, :gone
  belongs_to :timesheets

end
