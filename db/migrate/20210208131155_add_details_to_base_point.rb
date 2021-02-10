class AddDetailsToBasePoint < ActiveRecord::Migration[6.1]
  def change
    add_column :base_points, :base_number, :integer
    add_column :base_points, :base_name, :string
    add_column :base_points, :base_kind, :string
  end
end
