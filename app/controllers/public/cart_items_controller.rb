class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
  end

  def create
    item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    if item.present?
      cart_item_amount = item.amount + params[:cart_item][:amount].to_i
      if cart_item_amount > 10
        item.amount = 10
      else
        item.amount = cart_item_amount
      end
      item.save!
      redirect_to cart_items_path
    else
      cart_item = CartItem.new(cart_item_params)
      cart_item.customer_id = current_customer.id
      cart_item.save
      redirect_to cart_items_path
    end
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    cart_items = current_customer.cart_items
    cart_items.destroy_all
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
