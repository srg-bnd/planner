class InitTypeOfWeekToOccupations < ActiveRecord::Migration[6.0]
  def up
    Occupation.update_all(type_of_week: :simple)
  end

  def down
    Occupation.update_all(type_of_week: nil)
  end
end
