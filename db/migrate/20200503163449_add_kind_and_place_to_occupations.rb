class AddKindAndPlaceToOccupations < ActiveRecord::Migration[6.0]
  def change
    add_column :occupations, :kind, :string
    add_column :occupations, :place, :string
  end
end
