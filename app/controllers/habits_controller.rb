# frozen_string_literal: true

class HabitsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_habit, only: %i[update destroy]

  def index
    @habits = current_user.habits
    @new_habit = Habit.new(user: current_user)
  end

  def create
    @habit = current_user.habits.new(create_params)

    if @habit.save
      redirect_to habits_path, success: t('.flash.success')
    else
      flash[:danger] = t('.flash.danger')
      render :new
    end
  end

  def update
    @habit.assign_attributes(update_params)

    if @habit.save
      redirect_to habits_path, primary: t('.flash.success')
    else
      flash[:danger] = t('.flash.danger')
      render :edit
    end
  end

  def destroy
    if @habit.destroy
      redirect_to habits_path
    else
      flash[:danger] = t('.flash.danger')
    end
  end

  def progress
    @habits = current_user.habits.includes(:habit_days)
    @now = Time.zone.now.to_date
    @dates = (@now.at_beginning_of_month..@now.at_end_of_month)
  end

  private

  def habit_params
    params.require(:habit).permit(
      :name
    )
  end

  def create_params
    habit_params
  end

  def update_params
    habit_params
  end
end
