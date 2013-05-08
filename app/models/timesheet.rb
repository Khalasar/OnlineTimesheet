class Timesheet < ActiveRecord::Base
  attr_accessible :month, :year, :user_id
  belongs_to :user
  has_many :entries, :dependent => :destroy

  def daylist_for_date(date)
    entries_for_date = entries.select { |entry| entry.day == date}
    daylist = Daylist.new(entries_for_date)
  end

  def number_to_word(month)
     Date::MONTHNAMES[month]
  end

end
