class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
  belongs_to :user
  has_many :item_categories
  has_many :categories, through: :item_categories
  accepts_nested_attributes_for :item_categories, allow_destroy: true
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true

end
