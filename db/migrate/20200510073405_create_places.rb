class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :title
      t.integer :schedule_id, index: true

      t.timestamps
    end
  end
end
