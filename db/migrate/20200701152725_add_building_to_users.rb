class AddBuildingToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :building, :string
  end
end
