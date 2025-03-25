class Public::ItemsController < ApplicationController
  def index
    if params[:search].present?
      @items = Item.where('name LIKE ?', "%#{params[:search]}%").page(params[:page]).per(8)
    else
      @items = Item.page(params[:page]).per(8)
    end
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
