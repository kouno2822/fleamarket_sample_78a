class AddFirstNameFuriToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name_furi, :string
  end
end
