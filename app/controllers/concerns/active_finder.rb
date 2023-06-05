# frozen_string_literal: true

module ActiveFinder
  # Schedule
  def find_schedule(id = :id)
    @schedule = Schedule.find(params[id])
  end

  def find_schedule_with_prefix
    find_schedule :schedule_id
  end

  # Occupation
  def find_occupation(id = :id)
    @occupation = Occupation.find(params[id])
  end

  def find_occupation_with_prefix
    find_occupation :occupation_id
  end

  # Subject
  def find_subject(id = :id)
    @subject = Subject.find(params[id])
  end

  def find_subject_with_prefix
    find_subject :subject_id
  end

  # Task
  def find_task(id = :id)
    @task = Task.find(params[id])
  end

  def find_task_with_prefix
    find_task :task_id
  end

  # Place
  def find_place(id = :id)
    @place = Place.find(params[id])
  end

  def find_place_with_prefix
    find_place :place_id
  end

  # Field of activity
  def find_field_of_activity
    @field_of_activity = FieldOfActivity.find(params[:id])
  end

  def find_field_of_activity_prefix
    find_field_of_activity :find_field_of_activity_id
  end

  # Habit
  def find_habit(id = :id)
    @habit = Habit.find(params[id])
  end

  # Habit Day
  def find_habit(id = :id)
    @habit_day = HabitDay.find(params[id])
  end
end
