class Schedule < ApplicationRecord
  has_many :occupations

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

  def occupations_between(start_date, end_date)
    occupations.where(
      "
        (start_date >= :start_date) AND
        (end_date IS NULL AND start_date <= :end_date) OR
        (end_date IS NOT NULL AND end_date >= :start_date)
      ",
      start_date: start_date,
      end_date: end_date
    )
  end

  def occupations_this_week
    occupations_between(start_week, end_week).order(
      week: :asc,
      start_time: :asc
    )
  end
end
