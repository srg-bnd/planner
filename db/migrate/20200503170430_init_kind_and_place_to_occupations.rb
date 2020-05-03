class InitKindAndPlaceToOccupations < ActiveRecord::Migration[6.0]
  KIND_DEFAULT = 'lesson'.freeze
  PLACE_DEFAULT = 'home'.freeze

  def up
    Occupation.update_all(kind: KIND_DEFAULT, place: PLACE_DEFAULT)
  end

  def down
    Occupation.update_all(kind: nil, place: nil)
  end
end
