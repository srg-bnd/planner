class InitWeekToOccupations < ActiveRecord::Migration[6.0]
  def up
    Occupation.all.each do |occupation|
      occupation.set_week && occupation.save
    end
  end

  def down
    Occupation.update_all(week: nil)
  end
end
