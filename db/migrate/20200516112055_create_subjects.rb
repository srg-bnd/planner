class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.string :title
      t.integer :schedule_id
      t.index :schedule_id

      t.timestamps
    end
  end
end
