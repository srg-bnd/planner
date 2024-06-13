# frozen_string_literal: true

class PlacesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_schedule_with_prefix
  before_action :find_place, only: %i[update destroy]

  def index
    @places = @schedule.places
    @new_place = Place.new(schedule: @schedule)
  end

  def create
    @place = @schedule.places.new(create_params)

    if @place.save
      redirect_to schedule_places_path(@schedule), success: t('.flash.success')
    else
      flash[:danger] = t('.flash.danger')
      render :new
    end
  end

  def update
    @place.assign_attributes(update_params)

    if @place.save
      redirect_to schedule_places_path(@schedule), primary: t('.flash.success')
    else
      flash[:danger] = t('.flash.danger')
      render :edit
    end
  end

  def destroy
    if @place.destroy
      redirect_to schedule_places_path(@schedule)
    else
      flash[:danger] = t('.flash.danger')
    end
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
