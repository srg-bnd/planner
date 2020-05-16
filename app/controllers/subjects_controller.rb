class SubjectsController < ApplicationController
  before_action :have_access?
  before_action :find_schedule
  before_action :find_subject, only: [:update, :destroy]

  def index
    @subjects = @schedule.subjects
    @new_subject = Subject.new(schedule: @schedule)
  end

  def create
    @subject = @schedule.subjects.new(create_params)
    unless @subject.save
      flash[:danger] = t('.flash.danger')
      return render :new
    end

    redirect_to schedule_subjects_path(@schedule), success: t('.flash.success')
  end

  def update
    @subject.assign_attributes(update_params)
    unless @subject.save
      flash[:danger] = t('.flash.danger')
      return render :edit
    end

    redirect_to schedule_subjects_path(@schedule),
                primary: t('.flash.success')
  end

  def destroy
    unless @subject.destroy
      flash[:danger] = t('.flash.danger')
    end

    redirect_to schedule_subjects_path(@schedule)
  end

  private

  def find_schedule
    @schedule = Schedule.find(params[:schedule_id])
  end

  def find_subject
    @subject = Subject.find(params[:id])
  end

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
