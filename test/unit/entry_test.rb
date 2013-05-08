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
end
