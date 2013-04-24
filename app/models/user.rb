class User < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :password
  has_many :timesheets

  def fullname
    @fullname = firstname + " " + lastname
  end
end
