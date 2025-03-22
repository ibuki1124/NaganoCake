class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_detail = @order.order_details
    @total_price = 0
    @order_detail.each do |order_detail|
      @total_price += order_detail.item.with_tax_price * order_detail.amount
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order)
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end
end
