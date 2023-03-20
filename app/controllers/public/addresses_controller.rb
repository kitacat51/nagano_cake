class Public::AddressesController < ApplicationController
    def index
        @addresses = Address.all
    end
    
    def new
        @address = Address.new
    end
    
    def edit
        @address = Address.find(params[:id])
    end

    def create
      @address = Address.new(address_params)
      if @address.save
        redirect_to address_path(@address.id)
      else
        @addresses = Address.all
        render :index
      end
    end
    
    def update
      @address = address.find(params[:id])
      if @address.update(address_params)
         redirect_to address_path(@address.id)
      else
         render :edit
      end
    end

    def destroy
        address = Address.find(params[:id])
        address.destroy
        redirect_to address_path
    end
    
    
private
    def address_params
      params.require(:address).permit(:postal_code, :address, :name )
    end
end
