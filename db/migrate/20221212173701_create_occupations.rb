class CreateOccupations < ActiveRecord::Migration[6.1]
  def change
    create_table :occupations do |t|
      t.string :title
      t.references :schedule, null: false, foreign_key: true
      t.date :start_date
      t.time :start_time
      t.date :end_date
      t.time :end_time
      t.integer :week
      t.string :kind

      t.integer :place_id, index: true
      t.string :string_place

      t.integer :type_of_week, index: true

      t.integer :subject_id, index: true
      t.integer :field_of_activity_id, index: true

      t.timestamps
    end
  end
end
