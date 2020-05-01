class SchedulesController < ApplicationController
  before_action :find_schedule, only: [:show]

  def index; end

  def show; end

  private

  def find_schedule
    @schedule = Schedule.find(params[:id])
  end
end
