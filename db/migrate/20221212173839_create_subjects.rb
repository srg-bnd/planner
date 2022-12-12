class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.string :title
      t.integer :schedule_id, index: true

      t.timestamps
    end
  end
end
