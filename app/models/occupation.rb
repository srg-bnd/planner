# frozen_string_literal: true

class Occupation < ApplicationRecord
  belongs_to :schedule
  belongs_to :subject, optional: true
  belongs_to :place, optional: true
  belongs_to :field_of_activity, optional: true
  has_one_attached :appendix
  has_many :tasks

  enum week: {
    monday: 1,
    tuesday: 2,
    wednesday: 3,
    thursday: 4,
    friday: 5,
    saturday: 6,
    sunday: 7
  }

  enum type_of_week: {
    simple: 0,
    odd: 1,
    even: 2
  }

  validates_presence_of :start_date, :start_time, :end_time

  def self.custom_type_of_week
    [
      OpenStruct.new(id: :simple, title:
        I18n.t('.occupation.type_of_week.simple')),
      OpenStruct.new(id: :odd, title:
      I18n.t('.occupation.type_of_week.odd')),
      OpenStruct.new(id: :even, title:
      I18n.t('.occupation.type_of_week.even'))
    ]
  end

  def self.custom_week_days
    [
      OpenStruct.new(id: :monday, title:
        I18n.t('.occupation.week_days.mon')),
      OpenStruct.new(id: :tuesday, title:
      I18n.t('.occupation.week_days.tue')),
      OpenStruct.new(id: :wednesday, title:
      I18n.t('.occupation.week_days.wed')),
      OpenStruct.new(id: :thursday, title:
        I18n.t('.occupation.week_days.thu')),
      OpenStruct.new(id: :friday, title:
      I18n.t('.occupation.week_days.fri')),
      OpenStruct.new(id: :saturday, title:
      I18n.t('.occupation.week_days.sat')),
      OpenStruct.new(id: :sunday, title:
      I18n.t('.occupation.week_days.sun'))
    ]
  end

  def custom_week
    {
      monday: I18n.t('.occupation.week_days.mon'),
      tuesday: I18n.t('.occupation.week_days.tue'),
      wednesday: I18n.t('.occupation.week_days.wed'),
      thursday: I18n.t('.occupation.week_days.thu'),
      friday: I18n.t('.occupation.week_days.fri'),
      saturday: I18n.t('.occupation.week_days.sat'),
      sunday: I18n.t('.occupation.week_days.sun')
    }[week.to_sym]
  end

  def all_week
    @all_week ||= schedule.start_week.all_week.to_a
  end

  def current_week_day
    all_week[Occupation.weeks[week] - 1]
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
end
