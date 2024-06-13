# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :authenticate_user!, only: %i[create update destroy]
  before_action :find_schedule_with_prefix
  before_action :find_occupation_with_prefix
  before_action :find_task, only: %i[update destroy]

  def index
    @tasks = @occupation.tasks.order(complete: :asc, created_at: :desc)
    @task = Task.new
  end

  def create
    @task = @occupation.tasks.new(create_params)
    @task.occupation_date = @occupation.current_week_day

    if @task.save
      redirect_to schedule_occupation_tasks_path(@schedule, @occupation), success: t('.flash.success')
    else
      flash[:danger] = t('.flash.danger')
      render :new
    end
  end

  def update
    @task.assign_attributes(update_params)

    if @task.save
      redirect_to schedule_occupation_tasks_path(@schedule, @occupation), success: t('.flash.success')
    else
      flash[:danger] = t('.flash.danger')
      render :new
    end
  end

  def destroy
    if @task.destroy
      redirect_to schedule_occupation_tasks_path(@schedule, @occupation)
    else
      flash[:danger] = t('.flash.danger')
    end
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
end
