class AddYearToTimesheets < ActiveRecord::Migration
  def change
    add_column :timesheets, :year, :integer
  end
end
