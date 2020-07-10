class UsersController < ApplicationController

  def show
    @parents = Category.where(ancestry: nil)
    @sell_items = Item.where(sell_or_sold: '出品中').where(seller_id: current_user.id).order(created_at: :desc)
  end

  def logout
    @parents = Category.where(ancestry: nil)
  end

  def credit
    @parents = Category.where(ancestry: nil)
  end
end
