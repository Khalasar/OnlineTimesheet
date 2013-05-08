require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should create session" do
    user = User.new({firstname: "Andre",lastname: "Stuhrmann",password: "test"})
    user.save
    post :create, { :lastname => 'Stuhrmann', :password => 'test'}
    assert_redirected_to timesheets_path
    assert_equal "Erfolgreiches Log in.",flash[:notice]
  end

  test "should not create session" do
    post :create, { :lastname => 'Stuhrmann', :password => 'falsch'}
    assert_response :success
    assert_equal "Fehlerhafter Name oder Passwort.",flash[:alert]
  end

  test "should destroy session" do
    user = User.new({firstname: "Andre",lastname: "Stuhrmann",password: "test"})
    user.save
    delete :destroy, {:user_id => user.id}
    assert_redirected_to root_path
    assert_equal "Sie haben sich ausgeloggt.", flash[:notice]
  end
end