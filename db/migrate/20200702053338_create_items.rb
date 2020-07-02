class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :brand
      t.text :explanation
      t.string :status, null: false
      t.string :sell_or_sold, null: false
      t.integer :delivery_fee, null: false
      t.string :delivery_area, null: false
      t.string :delivery_day, null: false
      t.integer :price, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.integer :category_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
