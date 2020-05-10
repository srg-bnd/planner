class CreateFieldOfActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :field_of_activities do |t|
      t.string :title
      t.integer :schedule_id
      t.index :schedule_id

      t.timestamps
    end
  end
end
