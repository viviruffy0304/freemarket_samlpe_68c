class ProductsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
   

  end

  def edit
    @item = Item.find(params[:id])
    
  end

  def update
    

  end
end