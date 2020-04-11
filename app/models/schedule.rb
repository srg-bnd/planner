class Schedule < ApplicationRecord
  has_many :occupations

  def start_week
    (Date.today).monday
  end

  def end_week
    (Date.today).sunday
  end

  def last_occupation_updated_at
    occupation = occupations.order(updated_at: :desc).first
    occupation&.updated_at || updated_at
  end

  def occupations_between(start_date, end_date)
    # TODO: periods
    # (end_date IS NOT NULL AND end_date >= :start_date) OR
    occupations.where(
      "
        (start_date >= :start_date AND start_date <= :end_date)
      ",
      start_date: start_date,
      end_date: end_date
    )
  end

  def occupations_this_week
    occupations_between(start_week, end_week).order(
      start_date: :asc,
      start_time: :asc
    )
  end
end
