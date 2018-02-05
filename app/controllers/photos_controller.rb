class PhotosController < ApplicationController
    
  # GET /photos/new
  def new
    @photo = Photo.new
    binding.pry
  end    
    
end
