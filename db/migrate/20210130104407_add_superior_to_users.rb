class AddSuperiorToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :superior, :boolean
  end
end
