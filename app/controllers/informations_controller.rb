class InformationsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(
      :brand_id, 
      :category_id, 
      :name, 
      :description, 
      :state, 
      :postage, 
      :region, 
      :shipping_days, 
      :price, 
      images_attributes: [:id, :image]
    ).merge(seller_id: current_user.id)
  end
end