# README

# fleamarket_sample_78a DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_furi|string|null: false|
|first_name_furi|string|null: false|
|birth|date|null: false|
|send_last_name|string|null: false|
|send_first_name|string|null: false|
|send_last_name_furi|string|null: false|
|send_first_name_furi|string|null: false|
|post|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string||
|phone|integer||
### Association
- has_many :items
- has_one :card


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|brand|string||
|explanation|text|null: false|
|status|string|null: false|
|sell_or_sold|string|null: false|
|delivery_burden|string|null: false|
|prefecture_id|integer|null: false|
|delivery_day|string|null: false|
|price|integer|null: false|
|seller_id|integer|null: false, foreign_key: true|
|buyer_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :item_categories
- has_many :categories, through :item_categories
- has_many :images


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|integer|null: false|
### Association
- has_many :item_categories
- has_many :items, through :item_categories
- has_ancestry



## item_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|index: true, null: false, foreign_key: true|
|category_id|integer|index: true, null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :category


## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|integer|null: false|
|card_id|integer|null: false|
### Association
- belongs_to :user

