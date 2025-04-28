class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  before_action :check_cart_items, only: [:new, :confirm, :create]
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

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.item_id
      @order_detail.price = cart_item.item.with_tax_price
      @order_detail.amount = cart_item.amount
      @order_detail.save
    end
    @cart_items.destroy_all
    redirect_to thanks_path
  end

  def thanks
  end

  def index
    @orders = current_customer.orders.page(params[:page]).per(8)
  end

  def show
    @order = Order.find(params[:id])
    @total_price = 0
    @order.order_details.each do |order_detail|
      @total_price += order_detail.item.with_tax_price * order_detail.amount
    end
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :total_payment, :shipping_cost)
  end
  # 自身のカートに商品があるかどうか確認
  def check_cart_items
    if current_customer.cart_items.empty?
      redirect_to cart_items_path
    end
  end
end
