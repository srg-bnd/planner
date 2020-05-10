class InitPlaceToOccupations < ActiveRecord::Migration[6.0]
  def up
    Occupation.all.each do |occupation|
      occupation.update_columns(place_id: place(occupation).id)
    end

    remove_column :occupations, :string_place, :string
  end

  def down
    add_column :occupations, :string_place, :string

    Occupation.all.each do |occupation|
      occupation.update_columns(string_place: occupation&.place&.title)
    end

    Place.destroy_all
  end

  def place(occupation)
    schedule = occupation.schedule
    title = occupation.string_place
    place = Place.find_by(schedule: schedule, title: title)
    place || Place.create(schedule: schedule, title: title)
  end
end
