class OccupationsController < ApplicationController
  around_action :have_access?
  before_action :find_schedule
  before_action :find_occupation, only: [:edit, :update, :destroy]

  def index
    @occupations = @schedule.occupations.order(updated_at: :desc)
  end

  def new
    @places = @schedule.places
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

  def edit
    @places = []
    @field_of_activities = []

    if @occupation.place.present?
      @places << Place.new(
        title: t('occupations.new.form.place.prompt')
      )
    end

    if @occupation.field_of_activity.present?
      @field_of_activities << FieldOfActivity.new(
        title: t('occupations.new.form.field_of_activity.prompt')
      )
    end

    @places += @schedule.places
    @field_of_activities += @schedule.field_of_activities
  end

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
      :type_of_week,
      :week
    )
  end

  def create_params
    occupation_params
  end

  def update_params
    occupation_params
  end
end
