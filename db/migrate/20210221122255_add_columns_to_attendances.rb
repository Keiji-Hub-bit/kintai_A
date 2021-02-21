class AddColumnsToAttendances < ActiveRecord::Migration[6.1]
  def change
    add_column :attendances, :plan_end_time, :datetime
    add_column :attendances, :work_content, :string
    add_column :attendances, :instructor, :string
  end
end
