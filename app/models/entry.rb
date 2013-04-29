class Entry < ActiveRecord::Base
  attr_accessible :come, :day, :gone, :timesheets_id
  belongs_to :timesheets

end
