require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  test "create_entry" do
    come = Time.now
    gone = Time.now + 10.days
    entry = Entry.new({day: Date.today, come: come, gone: gone})
    today = Date.today
   
    assert_equal entry.day, today
    assert_equal entry.come, come.utc
    assert_equal entry.gone, gone.utc

    assert entry.valid?
    assert entry.save
  end

  test "calc_hours" do
    come = Time.now
    gone = Time.now + 5.hours
    entry = Entry.new({day: Date.today, come: come, gone: gone})
    time_difference = gone.utc - come.utc

    assert_equal entry.calc_hours, time_difference
  end

end
