class AddSendFirstNameFuriToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :send_first_name_furi, :string
  end
end
