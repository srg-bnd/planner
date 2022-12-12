class CreateFieldOfActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :field_of_activities do |t|
      t.string :title
      t.integer :schedule_id, index: true

      t.timestamps
    end
  end
end
