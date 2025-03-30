class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.page(params[:genre_page]).per(6)
    if params[:search].present?
      @items = Item.where('name LIKE ?', "%#{params[:search]}%").page(params[:page]).per(8)
      @title = params[:search] + "の検索結果"
    elsif params[:genre_name].present?
      @items = Item.where(genre_id: Genre.find_by(name: params[:genre_name]).id).page(params[:page]).per(8)
      @title = params[:genre_name] + "一覧"
    else
      @items = Item.page(params[:item_page]).per(8)
      @title = "商品一覧"
    end
    @total_count = @items.count
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.page(params[:genre_page]).per(6)
    @cart_item = CartItem.new
  end
end
