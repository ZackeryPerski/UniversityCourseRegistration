class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :major
      t.boolean :is_undergraduate
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
