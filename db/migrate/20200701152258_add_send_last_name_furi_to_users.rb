class AddSendLastNameFuriToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :send_last_name_furi, :string
  end
end
