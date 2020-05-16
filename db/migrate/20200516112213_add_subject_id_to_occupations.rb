class AddSubjectIdToOccupations < ActiveRecord::Migration[6.0]
  def change
    add_column :occupations, :subject_id, :integer
    add_index :occupations, :subject_id
  end
end
