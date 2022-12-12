# frozen_string_literal: true

# Occupations for this week
class Occupations::ThisWeekService
  attr_reader :schedule

  def initialize(schedule)
    @schedule = schedule
  end

  def call(params)
    occupations = schedule.occupations.where(
      type_of_week: schedule.types_week
    )

    occupations = filtered_service(occupations).call(params)
    occupations_this_week = schedule.occupations_this_week(occupations)
    occupations_this_week
  end

  protected

  def filtered_service(occupations)
    Occupations::FilteredService.new(occupations)
  end
end
