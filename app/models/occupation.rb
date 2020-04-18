class Occupation < ApplicationRecord
  belongs_to :schedule

  validates_presence_of :start_date, :start_time, :end_time

  def start_week
    start_date.strftime('%A')
  end

  def end_week
    end_date.strftime('%A')
  end
end
