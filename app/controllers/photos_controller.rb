class PhotosController < ApplicationController
    
  # GET /photos/new
  def new
    @photo = Photo.new
    #binding.pry
  end    

  def show
    @photo = Photo.find(params[:id])
    #binding.pry
  end 

  def create
    @photo = Photo.new(photo_params)
    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def photo_params
    params.require(:photo).permit(:name, :caption, :user_id, :park_id, :image, :category_ids => [], :categories_attributes => [:name])
  end

    
end
