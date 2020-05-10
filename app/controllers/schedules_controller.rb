class SchedulesController < ApplicationController
  before_action :find_schedule, only: [:show]

  def index; end

  def show
    occupations = @schedule.occupations.where(type_of_week: Schedule.types_week)

    if params[:place_id].present?
      occupations = occupations.where(place_id: params[:place_id])
    end
    if params[:field_of_activity_id].present?
      occupations = occupations.where(
        field_of_activity_id: params[:field_of_activity_id]
      )
    end
    @occupations_this_week = @schedule.occupations_this_week(occupations)
  end

  private

  def find_schedule
    @schedule = Schedule.find(params[:id])
  end
end
