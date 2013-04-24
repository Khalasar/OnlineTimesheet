class Timesheets < ActiveRecord::Base
  attr_accessible :month, :year
  belongs_to :user
  has_many :entries

  def daylist_for_date(date)
      entries_for_date = entries.select { |entry| entry.day == date}
      daylist = Daylist.new(entries_for_date)
  end
end
