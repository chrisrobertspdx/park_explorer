class ParksController < ApplicationController
    
    before_action :authorize_admin, :except => [:index,:show]
    
    def index
        @parks = Park.all
    end
    
    def show
        @park = Park.find(params[:id])
    end

    def new
        @park = Park.new
    end
    
    def create
        @park = Park.new(park_params)
        respond_to do |format|
          if @park.save
            format.html { redirect_to @park, notice: 'Park successfully created.' }
          else
            format.html { render action: 'new' }
          end
        end    
    end
    
    def edit
        @park = Park.find(params[:id])
    end 
    
    def update
        #authorized?
        @park = Park.find(params[:id])
        respond_to do |format|
          if @park.update(park_params)
            format.html { redirect_to @park, notice: 'Park successfully updated.' }
          else
            format.html { render :edit }
          end
        end
    end

    def destroy
        @park = Photo.find(params[:id])
        @park.destroy
        respond_to do |format|
            format.html { redirect_to parks_path, notice: 'Park successfully deleted.' }
        end
    end

    def park_params
        params.require(:park).permit(:name, :description)
    end
    
    private 
    
    def authorize_admin
        if current_user.role == nil || current_user.role != 'admin'
           flash[:alert] = "Unauthorized!!!!"
           redirect_to parks_path
        end
    end

end
