class AddWorkTimeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :work_time, :datetime, default: Time.current.change(hour: 7, min: 30, sec: 0)
  end
end
