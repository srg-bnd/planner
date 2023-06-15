# frozen_string_literal: true

# Profile
class ProfileController < ApplicationController
  before_action :authenticate_user!

  def show
    @count_of_schedules = current_user.schedules.count
    @count_of_habits = current_user.habits.count
    @count_of_checktasks = current_user.checktasks.doing.count
  end
end
