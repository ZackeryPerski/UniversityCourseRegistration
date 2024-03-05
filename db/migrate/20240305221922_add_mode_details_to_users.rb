class AddModeDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_index :users, :university_id
    change_column_null :users, :university_id, false
  end
end
