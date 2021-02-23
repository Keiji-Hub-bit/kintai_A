class AddNextDayToAttendances < ActiveRecord::Migration[6.1]
  def change
    add_column :attendances, :next_day, :string
  end
end
