class InformationsController < ApplicationController
  def index
  end

  def show
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to("/")
  end
end