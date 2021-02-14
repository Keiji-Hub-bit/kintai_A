class AddWorkTimeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :work_time, :string
    add_column :users, :datetime, :string
  end
end
