class CreateHabitDays < ActiveRecord::Migration[6.1]
  def change
    create_table :habit_days do |t|
      t.date :date
      t.references :habit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
