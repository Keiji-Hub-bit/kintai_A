class AddBacicInfoToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :employee_number, :string
    add_column :users, :card_ID, :string
    add_column :users, :basic_time, :datetime, default: Time.current.change(hour: 8, min: 0, sec: 0)
    add_column :users, :work_start_time, :detatime, default: Time.current.change(hour: 8, min: 30, sec: 0)
    add_column :users, :work_finish_time, :datetime, default: Time.current.change(hour: 17, min: 30, sec: 0)
  end
end
