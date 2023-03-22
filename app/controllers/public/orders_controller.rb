class Public::OrdersController < ApplicationController
    def new
      @order = Order.new
    end
    
    def confirm
        @order = Order.new(order_params)
        if params[:order][:address_number] == 0
          @order.postal_code = current_customer.postal_code
          @order.address = current_customer.address
          @order.name = current_customer.name
        elsif params[:order][:address_number] == 1
          @addresses = Address.all
        elsif params[:order][:address_number] == 2
        
        else
        
        end
    end
    
    def show
    end
    
    def create
    end
    
    def index
    end
    
private
  def order_params
      params.require(:order).permit(:postal_code, :address, :name, :payment_method, :status)
  end
    
    
end
