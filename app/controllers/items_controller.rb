class ItemsController < ApplicationController
  def index

  end

  def new
    @item = Item.new  
    
  end

  def create
    @items = Item.where(user_id: current_user)
  end

  private
  # def set_items
  #   @items = Item.find(params[:user_id])
  # end
  def item_params
    params.require(:item).permit(:brand_id, :category_id, :name, :description, :state, :postage, :region, :region, :shipping_days, :price).merge(user_id: current_user.id)
  end

end