class ItemsController < ApplicationController
  def index
  end

  def new
    #@item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
    
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:brand, :category, :name, :description, :state, :postage, :region, :shipping_days, :price,)
  end
end