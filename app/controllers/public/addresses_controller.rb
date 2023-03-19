class Public::AddressesController < ApplicationController
    def index
        @addresses = Addresses.all
    end
    
    def new
        @address = Address.new
    end
    
    def edit
    end

    def create
    end
    
    def update
    end

    def destroy
    end
end
