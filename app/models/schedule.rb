class Schedule < ApplicationRecord
  has_many :occupations
  has_many :places
  has_many :field_of_activities

  def self.type_of_week
    number = Time.now.strftime('%U').to_i + 1
    number.odd? ? :odd : :even
  end

  def self.types_week
    [:simple, Schedule.type_of_week]
  end

  def start_week
    Date.today.monday
  end

  def end_week
    Date.today.sunday
  end

  def last_occupation_updated_at
    occupation = occupations.order(updated_at: :desc).first
    occupation&.updated_at || updated_at
  end

  def occupations_between(need_occupations, start_date, end_date)
    need_occupations.where(
      "
        (start_date >= :start_date AND start_date <= :end_date) OR
        (
          end_date IS NOT NULL AND
          start_date < :start_date AND
          end_date >= :start_date
        )
      ",
      start_date: start_date,
      end_date: end_date
    )
  end

  def occupations_this_week(need_occupations)
    occupations_between(need_occupations, start_week, end_week).order(
      week: :asc,
      start_time: :asc
    )
  end
end
