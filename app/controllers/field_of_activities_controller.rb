# frozen_string_literal: true

class FieldOfActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_schedule_with_prefix
  before_action :find_field_of_activity, only: %i[update destroy]

  def index
    @field_of_activities = @schedule.field_of_activities
    @new_field_of_activity = FieldOfActivity.new(schedule: @schedule)
  end

  def create
    @field_of_activity = @schedule.field_of_activities.new(create_params)

    if @field_of_activity.save
      redirect_to schedule_field_of_activities_path(@schedule), success: t('.flash.success')
    else
      flash[:danger] = t('.flash.danger')
      render :new
    end
  end

  def update
    @field_of_activity.assign_attributes(update_params)

    if @field_of_activity.save
      redirect_to schedule_field_of_activities_path(@schedule), primary: t('.flash.success')
    else
      flash[:danger] = t('.flash.danger')
      render :edit
    end
  end

  def destroy
    if @field_of_activity.destroy
      redirect_to schedule_field_of_activities_path(@schedule)
    else
      flash[:danger] = t('.flash.danger')
    end
  end

  private

  def field_of_activity_params
    params.require(:field_of_activity).permit(
      :title
    )
  end

  def create_params
    field_of_activity_params
  end

  def update_params
    field_of_activity_params
  end
end
