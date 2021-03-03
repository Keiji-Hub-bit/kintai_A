class AddTitlesToAttendances < ActiveRecord::Migration[6.1]
  def change
    add_column :attendances, :after_started_at, :datetime
    add_column :attendances, :after_finished_at, :datetime
    add_column :attendances, :approval_day, :date
  end
end
