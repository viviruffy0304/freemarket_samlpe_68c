class InformationsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to("/")
  end
end