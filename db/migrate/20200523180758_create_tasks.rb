class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.integer :occupation_id
      t.index :occupation_id
      t.date :occupation_date
      t.boolean :complete

      t.timestamps
    end
  end
end
