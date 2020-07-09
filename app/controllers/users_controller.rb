class UsersController < ApplicationController

  def show
    @sell_items = Item.where(sell_or_sold: '出品中').where(user_id: current_user.id).order(created_at: :desc)
  end

  def logout
    
  end

  def credit
    
  end
end
