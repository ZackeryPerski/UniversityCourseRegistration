class AddPrimaryKeyToSectionsStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :sections_students, :id, :primary_key
  end
end
