class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  validates :nickname, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: true }, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, confirmation: true, length: { minimum: 7 }
  validates  :password_confirmation,presence: true
  VALID_NAME_REGEX = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
  validates :last_name, presence:true, format: { with: VALID_NAME_REGEX }
  validates :first_name, presence:true, format: { with: VALID_NAME_REGEX }
  validates :last_name_furi, presence:true, format: { with: VALID_NAME_REGEX }
  validates :first_name_furi, presence:true, format: { with: VALID_NAME_REGEX }
  validates :send_last_name, presence:true
  validates :send_first_name, presence:true
  validates :send_last_name_furi, presence:true
  validates :send_first_name_furi, presence:true
  VALID_POST_REGEX = /\A[0-9]{7}\z/
  validates :post, presence:true, format: { with: VALID_POST_REGEX }
  validates :prefecture, presence:true
  validates :city, presence:true
  validates :block, presence:true
  VALID_PHONE_REGEX = /\A[0-9]{10,11}\z/
  validates :phone, format: { with: VALID_PHONE_REGEX },allow_blank: true
end
