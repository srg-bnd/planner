class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :title
      t.string :description
      t.date :start_date

      t.timestamps
    end
  end
end
