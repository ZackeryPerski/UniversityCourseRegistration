class AddDepartmentHeadToDepartments < ActiveRecord::Migration[7.1]
  def change
    add_reference :departments, :department_head, foreign_key: { to_table: :instructors }
  end
end
