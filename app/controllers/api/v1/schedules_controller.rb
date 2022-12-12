# frozen_string_literal: true

# Schedules Controller
class Api::V1::SchedulesController < Api::V1::BaseController
  def index
    @schedules = current_user.schedules.order(created_at: :asc)
  end

  private

  def find_schedule
    @schedule = Schedule.find(params[:id])
  end
end
