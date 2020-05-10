class AddFieldOfActivityIdToOccupations < ActiveRecord::Migration[6.0]
  def change
    add_column :occupations, :field_of_activity_id, :integer
    add_index :occupations, :field_of_activity_id
  end
end
