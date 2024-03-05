class CreateJoinTableSectionStudent < ActiveRecord::Migration[7.1]
  def change
    create_join_table :sections, :students do |t|
      t.string :grade
      
      t.index [:section_id, :student_id]
      t.index [:student_id, :section_id]
    end
  end
end
