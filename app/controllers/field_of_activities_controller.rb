class FieldOfActivitiesController < ApplicationController
  before_action :have_access?
  before_action :find_schedule_with_prefix
  before_action :find_field_of_activity, only: [:update, :destroy]

  def index
    @field_of_activities = @schedule.field_of_activities
    @new_field_of_activity = FieldOfActivity.new(schedule: @schedule)
  end

  def create
    @field_of_activity = @schedule.field_of_activities.new(create_params)
    unless @field_of_activity.save
      flash[:danger] = t('.flash.danger')
      return render :new
    end

    redirect_to schedule_field_of_activities_path(@schedule),
                success: t('.flash.success')
  end

  def update
    @field_of_activity.assign_attributes(update_params)
    unless @field_of_activity.save
      flash[:danger] = t('.flash.danger')
      return render :edit
    end

    redirect_to schedule_field_of_activities_path(@schedule),
                primary: t('.flash.success')
  end

  def destroy
    unless @field_of_activity.destroy
      flash[:danger] = t('.flash.danger')
    end

    redirect_to schedule_field_of_activities_path(@schedule)
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
