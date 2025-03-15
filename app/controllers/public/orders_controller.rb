class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = current_customer.addresses
    @customer = current_customer
  end

  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.payment_method = params[:order][:payment_method] # 支払方法
    @order.shipping_cost = 800 # 送料（固定）
    @total_price = 0
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @total_price += cart_item.item.with_tax_price * cart_item.amount
    end
    @order.total_payment = @total_price + @order.shipping_cost # 請求金額
    if params[:order][:select_address] == "0" # ご自身の住所
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1" # 登録済住所
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:select_address] == "2" # 新しいお届け先
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
  end

  def thanks
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
end
