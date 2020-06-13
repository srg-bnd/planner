class SchedulesController < ApplicationController
  before_action :have_access?, only: [:edit, :update]
  before_action :find_schedule, only: [:show, :edit, :update]

  def index; end

  def show
    @occupations_this_week = occupations_this_week_service.call(params)
  end

  def edit; end

  def update
    @schedule.assign_attributes(update_params)
    unless @schedule.save
      flash[:danger] = t('.flash.danger')
      return render :edit
    end

    redirect_to edit_schedule_path(@schedule),
                primary: t('.flash.success')
  end

  private

  def schedule_params
    params.require(:schedule).permit(
      :title,
      :description,
      :start_date
    )
  end

  def update_params
    schedule_params
  end

  def occupations_this_week_service
    Occupations::ThisWeekService.new(@schedule)
  end
end
