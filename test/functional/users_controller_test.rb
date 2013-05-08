require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  test "new user" do
    get :new
    assert_response :success
  end

  test "should create user" do   
    post :create, :user => {:lastname => 'Stuhrmann', :firstname => 'Andre', :password => 'test', :password_confirmation => 'test'}
    assert_redirected_to login_path
    assert_equal "Benutzer erfolgreich angelegt.", flash[:notice]
  end

  test "should not create user" do
    post :create, :user => {:lastname => 'Stuhrmann', :firstname => 'Andre', :password => 'test', :password_confirmation => 'tes'}
    assert_response :success
  end

end
