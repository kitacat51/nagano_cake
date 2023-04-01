class Public::OrdersController < ApplicationController
    def new
      @order = Order.new
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name =  current_customer.last_name + current_customer.first_name
    end
    
    def confirm
        @order = Order.new(order_params)
        if params[:order][:address_number] == "0"
          @order.postal_code = current_customer.postal_code
          @order.address = current_customer.address
          @order.name = current_customer.first_name + current_customer.last_name
        elsif params[:order][:address_number] == "1"
          # @addresses = Address.all
          @address = Address.find(params[:order][:address_id])
          @order.postal_code = @address.postal_code
          @order.address = @address.address
          @order.name = @address.name
        elsif params[:order][:address_number] == "2"
          
        else
        
        end
        
        @cart_items = current_customer.cart_items
        @total_payment = 0
        @shopping_cost = 800
    end
    
    def create
      @order = Order.new(order_params)
      @order.customer_id = current_customer.id
      @order.save
      current_customer.cart_items.each do |cart_item|
       @order_detail = OrderDetail.new
       @order_detail.order_id = @order.id
       @order_detail.item_id = cart_item.item_id
       @order_detail.amount = cart_item.amount
       @order_detail.price = (cart_item.item.price*1.1).floor
       @order_detail.save
      end
      current_customer.cart_items.destroy_all
      redirect_to thanks_path
    end
    
    def thanks
      
    end
    
    def index
      @orders = current_customer.orders
    end
    
    def show
      @order = Order.find(params[:id])
      # @order = current_customer.orders.find(params[:id])
      @order_details = @order.order_details
      @total_payment = 0
      @order_details.each do |order_detail|
       @total_payment += order_detail.subtotal
      end
      @shopping_cost = 800
    end
    
private
  def order_params
      params.require(:order).permit(:postal_code, :address, :name, :payment_method, :shopping_cost, :total_payment )
  end
 
end
