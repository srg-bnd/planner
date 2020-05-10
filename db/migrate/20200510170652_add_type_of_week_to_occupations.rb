class AddTypeOfWeekToOccupations < ActiveRecord::Migration[6.0]
  def change
    add_column :occupations, :type_of_week, :integer
    add_index :occupations, :type_of_week
  end
end
