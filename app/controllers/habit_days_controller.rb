# frozen_string_literal: true

class HabitDaysController < ApplicationController
  #before_action :authenticate_user!
  before_action :find_habit_day, only: %i[update destroy]

  def create
    @habit_day = HabitDay.new(create_params)
    
    if @habit_day.save
      redirect_to progress_habits_path
    else
      flash[:danger] = t('.flash.danger')
      render :new
    end
  end

  def update
    @habit_day.draft = false

    if @habit_day.save
      redirect_to progress_habits_path
    else
      flash[:danger] = t('.flash.danger') unless @habit_day.save
    end
  end

  def destroy
    if @habit_day.destroy
      redirect_to progress_habits_path
    else
      flash[:danger] = t('.flash.danger')
    end
  end

  private

  def habit_day_params
    params.require(:habit_day).permit(
      :habit_id,
      :date
    )
  end

  def create_params
    habit_day_params
  end
end
