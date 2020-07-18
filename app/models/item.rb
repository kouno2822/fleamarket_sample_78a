class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
  has_many :item_categories
  has_many :categories, through: :item_categories
  accepts_nested_attributes_for :item_categories, allow_destroy: true
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true

  # バリデーション
  validates :images, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :brand, length: { maximum: 40 }
  validates :explanation, presence: true, length: { maximum: 1000 }
  validates :status, presence: true
  validates :sell_or_sold, presence:true
  validates :delivery_burden, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_day, presence: true
  validates :price, presence: true, inclusion: {in: 300..9999999 }
  validates :seller_id, presence: true
  validates :buyer_id, allow_blank: true, numericality: {only_integer: true}
  validates :category_id, presence: true, exclusion: { in: [0, 1, 200, 346, 481, 625, 685, 798, 898, 984],message: "を選択してください" }

end
