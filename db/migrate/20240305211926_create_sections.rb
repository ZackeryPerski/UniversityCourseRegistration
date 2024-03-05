class CreateSections < ActiveRecord::Migration[7.1]
  def change
    create_table :sections do |t|
      t.references :course, null: false, foreign_key: true
      t.references :instructor, null: false, foreign_key: true
      t.integer :capacity
      t.string :semester
      t.integer :year
      t.string :days
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
