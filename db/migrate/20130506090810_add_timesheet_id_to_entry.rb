class AddTimesheetIdToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :timesheet_id, :integer
  end
end
