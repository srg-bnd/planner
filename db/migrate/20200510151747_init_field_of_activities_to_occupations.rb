class InitFieldOfActivitiesToOccupations < ActiveRecord::Migration[6.0]
  def up
    Occupation.all.each do |occupation|
      occupation.update_columns(
        field_of_activity_id: field_of_activity(occupation).id
      )
    end

    remove_column :occupations, :kind, :string
  end

  def down
    add_column :occupations, :kind, :string

    Occupation.all.each do |occupation|
      occupation.update_columns(kind: occupation&.field_of_activity&.title)
    end

    FieldOfActivity.destroy_all
  end

  def field_of_activity(occupation)
    schedule = occupation.schedule
    title = occupation.kind
    field_of_activity = FieldOfActivity.find_by(
      schedule: schedule, title: title
    )
    field_of_activity || FieldOfActivity.create(
      schedule: schedule, title: title
    )
  end
end
