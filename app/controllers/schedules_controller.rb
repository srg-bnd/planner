class SchedulesController < ApplicationController
  before_action :have_access?, only: [:edit, :update]
  before_action :find_schedule, only: [:show, :edit, :update]

  def index; end

  def show
    occupations = @schedule.occupations.where(
      type_of_week: @schedule.types_week
    )

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

  def find_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(
      :title,
      :start_date
    )
  end

  def update_params
    schedule_params
  end
end
