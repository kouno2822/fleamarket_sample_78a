class ItemsController < ApplicationController
  def index
  end
  
  def new
    @item = Item.new
    # @item.images.new
    @category_parent_array = ["選択してください"]
    @category_parent_array = Category.where(ancestry: nil)
  end
end
