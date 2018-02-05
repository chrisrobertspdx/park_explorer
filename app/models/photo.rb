class Photo < ApplicationRecord
    
    belongs_to :park
    belongs_to :user
    
    has_many :photo_categories
    has_many :categories, :through => :photo_categories
    
    #attr_accessor :categories
    
    def categories_attributes=(data)
        #binding.pry
        #need to validate
        newCat = data["0"][:name].downcase.capitalize
        
        if newCat != ""
            @category = Category.find_or_create_by(name: newCat)
            self.categories << @category
        end
        
    end
    
    mount_uploader :image, ImageUploader
    
end
