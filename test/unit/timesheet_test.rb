require 'test_helper'

class TimesheetTest < ActiveSupport::TestCase
  test "create_timesheets" do
    timesheets = Timesheet.new({month: 1, year:2013})
    assert_equal timesheets.month, 1
    assert_equal timesheets.year, 2013

    assert timesheets.valid?
    assert timesheets.save
  end

  test "daylist for date" do
    date = Date.today
    timesheets = Timesheet.new({month: date.month, year:2013})

    timesheets.entries << Entry.new(day: date, come: Time.now-1.hour, gone: Time.now-30.minutes )
    timesheets.entries << Entry.new(day: date-1, come: Time.now-1.hour, gone: Time.now-30.minutes )

    timesheets.save
    daylist = timesheets.daylist_for_date(date)
    
    assert daylist.is_a?(Daylist)
    
    daylist.entries.each do |entry|
      assert entry.is_a?(Entry)
      assert_equal date, entry.day
    end
  end

  test "entry_addable" do
    date = Date.today
    timesheets = Timesheet.new({month: date.month, year:2013})
    timesheets.entries << Entry.new(day: date, come: Time.now-1.hour, gone: Time.now-30.minutes )
    timesheets.entries << Entry.new(day: date-1, come: Time.now-1.hour)
    timesheets.save
    assert_equal false, timesheets.entry_addable?

    timesheets1 = Timesheet.new({month: date.month, year:2013})
    timesheets1.entries << Entry.new(day: date, come: Time.now-1.hour, gone: Time.now-30.minutes )
    timesheets1.entries << Entry.new(day: date-1, come: Time.now-1.hour, gone: Time.now-30.minutes )
    timesheets1.save
    assert_equal true, timesheets1.entry_addable?
  end

end
