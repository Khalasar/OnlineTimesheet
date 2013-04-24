require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "create_user" do
    user = User.new({firstname: "Andre",lastname: "Stuhrmann",password: "test"})
    assert_equal user.firstname, "Andre"

    assert user.valid?
    assert user.save
  end
end
