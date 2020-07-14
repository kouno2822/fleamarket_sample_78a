class UsersController < ApplicationController
  before_action :move_to_login
  before_action :set_parent

  def show
    @sell_items = Item.where(sell_or_sold: '出品中').where(seller_id: current_user.id).order(created_at: :desc)
    @buy_items = Item.where(buyer_id: current_user.id).order(created_at: :desc)
  end

  def logout
  end

  def credit
  end

  def move_to_login
    redirect_to "/users/sign_in", notice: 'ログインするとご利用いただけます。' unless user_signed_in?
  end

end
