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
    end
    
    def show
      @order = Order.find(params[:id])
    end
    
    def create
      @order = Order.new(order_params)
      @order.save
      redirect_to confirm_path
    end
    
    def index
      @orders = Order.all
    end
    
private
  def order_params
      params.require(:order).permit(:postal_code, :address, :name, :payment_method, :status)
  end
    
end
