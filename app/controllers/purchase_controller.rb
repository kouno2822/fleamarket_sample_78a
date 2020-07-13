class PurchaseController < ApplicationController
  before_action :move_to_detail, except: :done
  require 'payjp'

  def index
    @item = Item.find(params[:item_id])
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    item = Item.find(params[:item_id])
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    amount: item.price, #支払金額を入力
    customer: card.customer_id, #顧客ID
    currency: 'jpy', #日本円
    )
    item.sell_or_sold = "Sold"
    item.buyer_id = current_user.id
    if item.save
    end
    redirect_to action: 'done'
  end

  def done
    @item = Item.find(params[:item_id])
  end

  def move_to_detail
    redirect_to '/users/show' if current_user.id == @item.seller_id || @item.buyer_id != nil
  end

end
