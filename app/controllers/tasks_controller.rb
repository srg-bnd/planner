class TasksController < ApplicationController
  before_action :have_access?, only: [:create, :update, :destroy]
  before_action :find_schedule
  before_action :find_occupation
  before_action :find_task, only: [:update, :destroy]

  def index
    @tasks = @occupation.tasks.where(
      occupation_date: @occupation.current_week_day
    ).order(complete: :asc, created_at: :desc)
    @task = Task.new
  end

  def create
    @task = @occupation.tasks.new(create_params)
    @task.occupation_date = @occupation.current_week_day

    unless @task.save
      flash[:danger] = t('.flash.danger')
      return render :new
    end

    redirect_to schedule_occupation_tasks_path(
      @schedule, @occupation
    ), success: t('.flash.success')
  end

  def update
    @task.assign_attributes(update_params)

    unless @task.save
      flash[:danger] = t('.flash.danger')
      return render :new
    end

    redirect_to schedule_occupation_tasks_path(
      @schedule, @occupation
    ), success: t('.flash.success')
  end

  def destroy
    unless @task.destroy
      flash[:danger] = t('.flash.danger')
    end

    redirect_to schedule_occupation_tasks_path(
      @schedule, @occupation
    )
  end

  protected

  def task_params
    params.require(:task)
  end

  def create_params
    task_params.permit(
      :title, :description
    )
  end

  def update_params
    task_params.permit(
      :title, :description, :complete
    )
  end

  private

  def find_schedule
    @schedule = Schedule.find(params[:schedule_id])
  end

  def find_occupation
    @occupation = Occupation.find(params[:occupation_id])
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
