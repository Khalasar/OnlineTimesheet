require 'test_helper'

class TimesheetsControllerTest < ActionController::TestCase
  test "should get index" do
    login!

    get :index
    assert_response :success

    #logout!

    #get :index
    #assert_redirected_to login_path
  end

  test "should create new timesheet" do
    login!

    get :new
    assert_redirected_to timesheets_path
    assert_equal "Ein neuer Stundenzettel wurde erstellt.", flash[:notice]
  end

  test "should show timesheet" do
    user = User.create({:firstname => "Andre", :lastname => "Stuhrmann", :password => "test", :password_confirmation => "test"})
    login! user
    date = Date.today
    time = Time.now
    timesheet = user.timesheets.create(:month => date.month, :year => date.year)
    entry = timesheet.entries.create(:day => date, :come => time, :gone => time + 1.hours)

    get :show, :id => timesheet.id

    assert_not_nil :entries
    assert_not_nil :timesheet
  end

  test "should destroy timesheet" do 
    user = User.create({:firstname => "Andre", :lastname => "Stuhrmann", :password => "test", :password_confirmation => "test"})
    login! user
    date = Date.today
    time = Time.now
    timesheet = user.timesheets.create(:month => date.month, :year => date.year)

    delete :destroy, :id => timesheet.id
    assert_redirected_to timesheets_url
    assert_equal "Der Stundenzettel wurde gelöscht.", flash[:notice]
  end

  test "should update timesheet" do
    user = User.create({:firstname => "Andre", :lastname => "Stuhrmann", :password => "test", :password_confirmation => "test"})
    login! user
    date = Date.today
    time = Time.now
    timesheet = user.timesheets.create(:month => date.month, :year => date.year)

    put :update, :id => timesheet

    assert_redirected_to timesheet_path
    assert_not_nil :entries
  end

end
