class OccupationsController < ApplicationController
  around_action :have_access?
  before_action :find_schedule
  before_action :find_occupation, only: [:edit, :update, :destroy]

  def index
    @occupations = @schedule.occupations
  end

  def new
    @occupation = @schedule.occupations.new
  end

  def create
    @occupation = @schedule.occupations.new(create_params)
    unless @occupation.save
      flash[:danger] = t('.flash.danger')
      return render :new
    end

    redirect_to @schedule, success: t('.flash.success')
  end

  def edit; end

  def update
    @occupation.assign_attributes(update_params)
    unless @occupation.save
      flash[:danger] = t('.flash.danger')
      return render :edit
    end

    redirect_to schedule_occupations_path(@schedule),
                success: t('.flash.success')
  end

  def destroy
    unless @occupation.destroy
      flash[:danger] = t('.flash.danger')
    end

    redirect_to schedule_occupations_path(@schedule)
  end

  private

  def find_schedule
    @schedule = Schedule.find(params[:schedule_id])
  end

  def find_occupation
    @occupation = Occupation.find(params[:id])
  end

  def occupation_params
    params.require(:occupation).permit(
      :title,
      :schedule_id,
      :start_date,
      :start_time,
      :end_date,
      :end_time,
      :place_id,
      :field_of_activity_id,
      :type_of_week
    )
  end

  def create_params
    occupation_params
  end

  def update_params
    occupation_params
  end
end
