class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :firstname, :lastname, :password
  has_many :timesheets

  validates :firstname, :lastname, presence: true

  def fullname
    @fullname = firstname + " " + lastname
  end
end
