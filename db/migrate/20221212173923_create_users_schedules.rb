class CreateUsersSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :users_schedules do |t|
      t.belongs_to :user
      t.belongs_to :schedule

      t.timestamps
    end
  end
end
