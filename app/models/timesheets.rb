class Timesheets < ActiveRecord::Base
  attr_accessible :month, :year
  belongs_to :user
  has_many :entries
end
