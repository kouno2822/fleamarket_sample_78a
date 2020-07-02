class AddPostToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :post, :numeric
  end
end
