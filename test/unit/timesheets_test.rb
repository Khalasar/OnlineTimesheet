require 'test_helper'

class TimesheetsTest < ActiveSupport::TestCase
  test "create_timesheets" do
    timesheets = Timesheets.new({month: 1, year:2013})
    assert_equal timesheets.month, 1
    assert_equal timesheets.year, 2013

    assert timesheets.valid?
    assert timesheets.save
  end
end
