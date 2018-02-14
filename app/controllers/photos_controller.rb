class PhotosController < ApplicationController
    
  # GET /photos/new
  def new
    @photo = Photo.new
    @photo.user_id = current_user.id
    @photo.park_id = params[:park_id]
    
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

  def edit
    #authorized?
    @photo = Photo.find(params[:id])
    #binding.pry
  end 

  def update
    #authorized?
    @photo = Photo.find(params[:id])
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo.park, notice: 'Photo was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @park = @photo.park
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to @park, notice: 'Photo was successfully deleted.' }
    end
  end

  def photo_params
    params.require(:photo).permit(:name, :caption, :user_id, :park_id, :image, :category_ids => [], :categories_attributes => [:name])
  end

    
end
