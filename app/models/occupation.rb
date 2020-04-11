class Occupation < ApplicationRecord
  belongs_to :schedule

  def start_week
    start_date.strftime('%A')
  end

  def end_week
    end_date.strftime('%A')
  end
end
