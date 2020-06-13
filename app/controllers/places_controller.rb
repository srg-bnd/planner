class PlacesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_schedule_with_prefix
  before_action :find_place, only: [:update, :destroy]

  def index
    @places = @schedule.places
    @new_place = Place.new(schedule: @schedule)
  end

  def create
    @place = @schedule.places.new(create_params)
    unless @place.save
      flash[:danger] = t('.flash.danger')
      return render :new
    end

    redirect_to schedule_places_path(@schedule), success: t('.flash.success')
  end

  def update
    @place.assign_attributes(update_params)
    unless @place.save
      flash[:danger] = t('.flash.danger')
      return render :edit
    end

    redirect_to schedule_places_path(@schedule),
                primary: t('.flash.success')
  end

  def destroy
    unless @place.destroy
      flash[:danger] = t('.flash.danger')
    end

    redirect_to schedule_places_path(@schedule)
  end

  private

  def place_params
    params.require(:place).permit(
      :title
    )
  end

  def create_params
    place_params
  end

  def update_params
    place_params
  end
end
