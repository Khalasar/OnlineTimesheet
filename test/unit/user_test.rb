require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "valid factory" do
    user = FactoryGirl.build :user
    assert user.valid?
  end

  test "create_user" do
    user = User.new({firstname: "Andre",lastname: "Stuhrmann",password: "test"})
    assert_equal user.firstname, "Andre"
    assert_equal user.lastname, "Stuhrmann"
    assert_equal user.password, "test"

    assert user.valid?
    assert user.save
  end

  test "fullname" do
    user = User.new({firstname: "Andre",lastname: "Stuhrmann",password: "test"})
    assert_equal user.fullname, "Andre Stuhrmann"
  end
end
