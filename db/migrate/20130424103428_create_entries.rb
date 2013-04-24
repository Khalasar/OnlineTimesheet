class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.date :day
      t.datetime :come
      t.datetime :gone

      t.timestamps
    end
  end
end
