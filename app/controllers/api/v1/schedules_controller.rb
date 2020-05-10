# frozen_string_literal: true

# Schedules Controller
class Api::V1::SchedulesController < Api::V1::BaseController
  before_action :find_schedule, only: [:show]

  def index
    @schedules = Schedule.all
    @menu = menu_for_index
  end

  def show; end

  private

  def find_schedule
    @schedule = Schedule.find(params[:id])
  end

  def menu_for_index
    [
      OpenStruct.new(
        position: 0,
        title: t('schedules.index.title.info'),
        href: '#',
        active: true,
        disabled: false
      ),
      OpenStruct.new(
        position: 2,
        title: t('schedules.index.title.config'),
        href: '#',
        active: false,
        disabled: true
      )
    ]
  end
end
