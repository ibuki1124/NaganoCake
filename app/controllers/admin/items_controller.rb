class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def show
  end

  def edit
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :genre_id, :is_active)
  end
end
