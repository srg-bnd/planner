# frozen_string_literal: true

# HabitDays
class HabitDaysController < ApplicationController
  before_action :authenticate_user!
  before_action :find_habit, only: %i[destroy]

  def create
    @habit_day = HabitDay.new(create_params)
    unless @habit_day.save
      flash[:danger] = t('.flash.danger')
      return render :new
    end

    redirect_to progress_habits_path
  end

  def destroy
    flash[:danger] = t('.flash.danger') unless @habit_day.destroy

    redirect_to progress_habits_path
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
