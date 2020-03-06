class InformationsController < ApplicationController
  before_action :set_item, only: [:show, :edit, ]


  def index
    @items = Item.limit(3).order('created_at DESC')
  end

  def show
    
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:user_id, :seller_id, :buyer_id, :brand_id,:category_id, :description, :state, :postage, :region,:shipping_days, :price, images_attributes: [:id, :image]).merge(seller_id: current_user.id)
  end


  def set_item
    @item = Item.find(params[:id])
  end

end