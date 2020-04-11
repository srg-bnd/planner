class OccupationsController < ApplicationController
  around_action :have_access?
  before_action :find_occupation, only: [:destroy]

  def index
    @schedule = Schedule.find(params[:schedule_id])
    @occupations = @schedule.occupations
  end

  def new
    @occupation = Occupation.new(schedule_id: params[:schedule_id])
  end

  def create
    occupation = Occupation.new(create_params)

    if occupation.save
      redirect_to occupation.schedule
    else
      render :new
    end
  end

  def destroy
    schedule = @occupation.schedule
    if @occupation.destroy
      redirect_to occupations_path(schedule_id: schedule.id)
    else
      raise ActionController::RoutingError.new('Bad Request')
    end
  end

  private

  def have_access?
    if session[:secret_token] == ENV['CONTROLLER_SECRET_TOKEN']
      yield
    else
      raise ActionController::RoutingError.new('Forbidden')
    end
  end

  def find_occupation
    @occupation = Occupation.find(params[:id])
  end

  def create_params
    params.require(:occupation).permit(
      :title,
      :schedule_id,
      :start_date,
      :start_time,
      :end_date,
      :end_time
    )
  end
end
