class Schedule < ApplicationRecord
  def start_week
    (Date.today).monday
  end

  def end_week
    (Date.today).sunday
  end

  def last_occupation_updated_at
    # TODO: use occupations
    updated_at
  end
end
