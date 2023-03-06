class Admin::ItemsController < ApplicationController
    def index
      @items = Item.all
      
    end
    
    def new
      @genres = Genre.all
    end
    
    def create
    end
    
    def show
      @item = Item.find(params[:id])
    end
    
    def edit
    end
    
    def update
    end
    
  private
    def item_params
      params.require(:item).permit(:image, :name, :introduction, :price)
    end
end
