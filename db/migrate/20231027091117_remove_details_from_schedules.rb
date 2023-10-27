class RemoveDetailsFromSchedules < ActiveRecord::Migration[6.1]
  def change
    remove_column :schedules, :StartDate, :date
    remove_column :schedules, :EndDate, :date
  end
end
