class AddSendLastNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :send_last_name, :string
  end
end
