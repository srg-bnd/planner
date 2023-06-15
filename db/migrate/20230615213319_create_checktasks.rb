class CreateChecktasks < ActiveRecord::Migration[6.1]
  def change
    create_table :checktasks do |t|
      t.string :title
      t.date :date
      t.boolean :done

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
