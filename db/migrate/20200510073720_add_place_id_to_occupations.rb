class AddPlaceIdToOccupations < ActiveRecord::Migration[6.0]
  def change
    rename_column :occupations, :place, :string_place
    add_column :occupations, :place_id, :integer
    add_index :occupations, :place_id
  end
end
