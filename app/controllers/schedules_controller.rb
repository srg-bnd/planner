class SchedulesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_schedule, only: [:show, :edit, :update, :destroy]

  def index; end

  def show
    @occupations_this_week = occupations_this_week_service.call(params)
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(create_params)

    if @schedule.save
      current_user.schedules << @schedule
      redirect_to edit_schedule_path(@schedule), success: t('.flash.success')
    else
      flash[:danger] = t('.flash.danger')
      render :new
    end      
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

  def destroy
    if @schedule.users.includes(current_user) && @schedule.destroy
      redirect_to root_path, success: t('.flash.success')
    else
      redirect_to edit_schedule_path(@schedule), danger: t('.flash.danger')
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(
      :title,
      :description,
      :start_date
    )
  end

  def create_params
    schedule_params
  end

  def update_params
    schedule_params
  end

  def occupations_this_week_service
    Occupations::ThisWeekService.new(@schedule)
  end
end
