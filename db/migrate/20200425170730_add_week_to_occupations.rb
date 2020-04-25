class AddWeekToOccupations < ActiveRecord::Migration[6.0]
  def change
    add_column :occupations, :week, :integer
  end
end
