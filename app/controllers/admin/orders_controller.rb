class Admin::OrdersController < ApplicationController
    def show
      @order = Order.find(params.id)
      @order_details = OrderDetail.where(order_id: params[:id])
    end

    def update
      @order = Order.find(params.id)
      @order_detail = OrderDetail.where(order_id: params[:id])
    end


   private
    def order_params
      params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shopping_cost, :total_payment, :payment_method, :status, :order_detail)
    end

end
