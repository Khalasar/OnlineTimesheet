require 'test_helper'

class DaylistTest < ActiveSupport::TestCase

  test "calc_break" do
    date = Date.today

    timesheets = Timesheets.new ({month: date.month, year: date.year})

    time = Time.now

    timesheets.entries << Entry.new(day: date, come: time-1.hour, gone: time-30.minutes )
    timesheets.entries << Entry.new(day: date, come: time-2.hour, gone: time-90.minutes )

    timesheets.save

    daylist = timesheets.daylist_for_date(date)

    assert_equal daylist.calc_break, 30.minutes
  end

  test "spend_time" do
    date = Date.today

    timesheets = Timesheets.new ({month: date.month, year: date.year})

    time = Time.now

    timesheets.entries << Entry.new(day: date, come: time-1.hour, gone: time-30.minutes )
    timesheets.entries << Entry.new(day: date, come: time-2.hour, gone: time-90.minutes )

    timesheets.save

    daylist = timesheets.daylist_for_date(date)

    assert_equal daylist.spend_time, 1.hours
  end

end