class Public::CustomersController < ApplicationController
    def mypage
        @customer = current_customer
    end
    
    def edit
       @customer = current_customer
    end
    
    def update
        @customer = current_customer
        if @customer.update(customer_params)
           flash[:notice] = "You have updated customer successfully."
           redirect_to mypage_path(current_customer)
        else
           render :edit
        end
    end
    
    def unsubscribe
       @customer = current_customer
    end

    def withdrawal
       @customer = current_customer
        if @customer.update(is_deleted: true)
           reset_session
           redirect_to root_path
        else
           redirect_to unsubscribe_path
        end
    end
    
        
private
   def customer_params
     params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number)
   end
end
