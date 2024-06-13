# frozen_string_literal: true

class SubjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_schedule_with_prefix
  before_action :find_subject, only: %i[update destroy]

  def index
    @subjects = @schedule.subjects
    @new_subject = Subject.new(schedule: @schedule)
  end

  def create
    @subject = @schedule.subjects.new(create_params)

    if @subject.save
      redirect_to schedule_subjects_path(@schedule), success: t('.flash.success')
    else
      flash[:danger] = t('.flash.danger')
      render :new
    end
  end

  def update
    @subject.assign_attributes(update_params)

    if @subject.save
      redirect_to schedule_subjects_path(@schedule), primary: t('.flash.success')
    else
      flash[:danger] = t('.flash.danger')
      render :edit
    end
  end

  def destroy
    if @subject.destroy
      redirect_to schedule_subjects_path(@schedule)
    else
      flash[:danger] = t('.flash.danger')
    end
  end

  private

  def subject_params
    params.require(:subject).permit(
      :title
    )
  end

  def create_params
    subject_params
  end

  def update_params
    subject_params
  end
end
