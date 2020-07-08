class CreateItemCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :item_categories do |t|
      t.references :item, index: true, null: false, foreign_key: true
      t.references :category, index: true,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
