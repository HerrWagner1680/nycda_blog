class AddStaffOrStudentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :staff_or_student, :string
  end
end
