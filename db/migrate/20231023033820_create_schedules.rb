class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :title
      t.date :StartDate
      t.date :EndDate
      t.boolean :is_all_day

      t.timestamps
    end
  end
end
