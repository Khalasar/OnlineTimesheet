require 'test_helper'

class EntriesControllerTest < ActionController::TestCase
  
  test "should update entry" do
    timesheet = Timesheet.create({:year => 2013, :month => 5})
    entry = timesheet.entries.create({:day => Date.today, :come => Time.now})
    put :update, :id => entry.id, :timesheet_id => timesheet.id

    assert_equal 'Erfolgreich gespeichert', flash[:notice]
    assert_redirected_to timesheet_path(timesheet)
  end

  test "should destroy entry" do
    timesheet = Timesheet.create({:year => 2013, :month => 5})
    entry = timesheet.entries.create({:day => Date.today, :come => Time.now})
    delete :destroy, :id => entry.id, :timesheet_id => timesheet.id

    assert_redirected_to timesheet_path(timesheet)
    assert_equal 'Der Eintrag wurde gelöscht.', flash[:notice]
  end

end
