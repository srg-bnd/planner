class CreateOccupations < ActiveRecord::Migration[6.0]
  def change
    create_table :occupations do |t|
      t.string :title
      t.references :schedule, null: false, foreign_key: true
      t.date :start_date
      t.time :start_time
      t.date :end_date
      t.time :end_time

      t.timestamps
    end
  end
end
