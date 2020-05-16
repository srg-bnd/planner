class InitSubjectIdToOccupations < ActiveRecord::Migration[6.0]
  def up
    Occupation.all.each do |occupation|
      occupation.update_columns(
        subject_id: subject(occupation).id
      )
    end

    remove_column :occupations, :title, :string
  end

  def down
    add_column :occupations, :title, :string

    Occupation.all.each do |occupation|
      occupation.update_columns(title: occupation&.subject&.title)
    end

    Subject.destroy_all
  end

  def subject(occupation)
    schedule = occupation.schedule
    title = occupation.title
    subject = Subject.find_by(
      schedule: schedule, title: title
    )
    subject || Subject.create(
      schedule: schedule, title: title
    )
  end
end
