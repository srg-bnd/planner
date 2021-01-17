class CreateUsersSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :users_schedules do |t|
      t.belongs_to :user
      t.belongs_to :schedule
    end
  end
end
