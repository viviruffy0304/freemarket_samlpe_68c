class InformationsController < ApplicationController
  before_action :set_item, only: [:show, :edit, ]


  def index
  end

  def show
    # @images = Image.where(item_id: @item.id)
    # @category = @item.category
  end

  

  private

  def item_params
    params.require(:item).permit(:user_id, :seller_id, :buyer_id, :brand_id,:category_id, :description, :state, :postaget, :region,:shipping_days, :price, images_attributes: [:id, :image]).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_seller
    # @user = User.find(params[:seller_id])
  end

end