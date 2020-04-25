class Occupation < ApplicationRecord
  belongs_to :schedule

  enum week: {
    monday: 1,
    tuesday: 2,
    wednesday: 3,
    thursday: 4,
    friday: 5,
    saturday: 6,
    sunday: 7
  }

  validates_presence_of :start_date, :start_time, :end_time

  before_save :set_week, if: :start_date_changed?

  def set_week
    self.week = start_date.cwday
  end

  def all_week
    @all_week ||= schedule.start_week.all_week.to_a
  end

  def current_week_day
    all_week[start_date.cwday - 1]
  end

  def color
    {
      'monday' => '#50c7c7',
      'tuesday' => '#50c75f',
      'wednesday' => '#c76b50',
      'thursday' => '#6550c7',
      'friday' => '#c75052',
      'saturday' => '#ebdd60',
      'sunday' => '#eb60bc'
    }.fetch(week, '#50c7c7')
  end

  def start_week
    I18n.l(start_date, format: '%A')
  end
end
