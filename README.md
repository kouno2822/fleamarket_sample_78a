# README


# fleamarket_sample_78a DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|mail|string|null: false, unique: true|
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
|block|integer|null: false|
|building|string||
|phone|integer||
### Association
- has_many :products
- belongs_to :card


## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|brand|string||
|explanation|text|null: false|
|status|string|null: false|
|delivery_fee|integer|null: false|
|delivery_area|string|null: false|
|delivery_day|integer|null: false|
|price|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :categorie
- belongs_to :image


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image1|text|null: false|
|image2|text||
|image3|text||
|image4|text||
|image5|text||
|image6|text||
|image7|text||
|image8|text||
|image9|text||
|image10|text||
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :product


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|integer|null: false|
### Association
- has_many :products


## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|integer|null: false|
|card_id|integer|null: false|
### Association
- belongs_to :user