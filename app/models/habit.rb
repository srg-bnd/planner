# frozen_string_literal: true

class Habit < ApplicationRecord
  belongs_to :user
  has_many :habit_days

  def habit_day_by_date(date)
    habit_days.select { |habit_day| habit_day.date.to_s == date.to_s }.first
  end
end
