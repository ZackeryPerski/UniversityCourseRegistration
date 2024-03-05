class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.references :department, null: false, foreign_key: true
      t.string :code
      t.integer :credits

      t.timestamps
    end
  end
end
