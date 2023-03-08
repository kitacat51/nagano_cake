class Admin::ItemsController < ApplicationController
    def index
      @items = Item.all
      
    end
    
    def new
      @item = Item.new
      @genres = Genre.all
    end
    
    def create
      @item = Item.new(item_params)
      if @item.save
        redirect_to admin_items_path(@item.id)
      else
        render :admin_items_path
      end
    end
    
    def show
      @item = Item.find(params[:id])
    end
    
    def edit
      @item = Item.find(params[:id])
    end
    
    def update
      @item = Item.find(params[:id])
      if @item.update(item_params)
         redirect_to admin_items_path(@item.id)
      else
         render :edit_admin_items_path
      end
    end
    
  private
    def item_params
      params.require(:item).permit(:image, :name, :introduction, :price,:is_active )
    end
end