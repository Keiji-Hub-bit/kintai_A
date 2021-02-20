class AddColumnToLogs < ActiveRecord::Migration[6.1]
  def change
    add_column :logs, :before_started_at, :datetime
    add_column :logs, :before_finished_at, :datetime
    add_column :logs, :after_started_at, :datetime
    add_column :logs, :after_finished_at, :datetime
    add_column :logs, :instructor, :string
    add_column :logs, :approval_day, :date
  end
end
