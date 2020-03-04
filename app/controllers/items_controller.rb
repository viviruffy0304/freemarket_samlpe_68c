class ItemsController < ApplicationController
  def index
    @image = Image.find(1)
  end

  def new
    @item = Item.new  
    @item.images.build
    # @item.build_images
  end

  def create
    # Team.create(item_params)
    binding.pry
    @item = Item.new(item_params)
    if @item.save
      # flash[:success] = "商品を登録しました"
      # session[:user_id] = @user.id # ログイン状態維持のためuser_idをsessionに保存
      
      render 'index'
    else
      # flash[:danger] = "商品登録に失敗しました"
      # binding.pry
      render 'new'
    end
  end

  private
  # def set_items
  #   @items = Item.find(params[:user_id])
  # end
  def item_params
    params.require(:item).permit(
      :brand_id, 
      :category_id, 
      :name, 
      :description, 
      :state, 
      :postaget, 
      :region, 
      :shipping_days, 
      :price, 
      images_attributes: [:id, :image]
    ).merge(seller_id: current_user.id)
  end
end