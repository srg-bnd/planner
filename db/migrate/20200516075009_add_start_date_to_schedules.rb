class AddStartDateToSchedules < ActiveRecord::Migration[6.0]
  def change
    add_column :schedules, :start_date, :date
  end
end
