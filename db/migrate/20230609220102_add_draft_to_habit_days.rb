class AddDraftToHabitDays < ActiveRecord::Migration[6.1]
  def change
    add_column :habit_days, :draft, :boolean
  end
end
