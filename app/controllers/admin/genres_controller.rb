class Admin::GenresController < ApplicationController
    def index
       @genres = Genre.all
    end
    
    def create
       @genre = Genre.new(genre_params)
       if @genre.save
          redirect_to admin_genre_path(@genre.id)
       else
          render :admin_genre_path
       end
    end
    
    def edit
       @genre = Genre.find(params[:id])
    end
    
    def update
      @genre = Genre.find(params[:id])
      if @genre.update(genre_params)
         redirect_to admin_genre_path(@genre.id)
      else
         render :edit_admin_items_path
      end


    end

  private
    def genre_params
      params.require(:genre).permit(:name)
    end
end
