class AddDetailsToAttendances < ActiveRecord::Migration[6.1]
  def change
    add_column :attendances, :approval_month, :date
    add_column :attendances, :instructor_confirmation_month, :integer
    add_column :attendances, :instructor_select_month, :string
  end
end
