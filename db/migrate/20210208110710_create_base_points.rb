class CreateBasePoints < ActiveRecord::Migration[6.1]
  def change
    create_table :base_points do |t|

      t.timestamps
    end
  end
end
