class AddTimesheetsIdToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :timesheets_id, :integer
  end
end
