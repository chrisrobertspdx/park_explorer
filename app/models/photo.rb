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
            #self.categories << @category
            #update score
            @pc = PhotoCategory.new
            @pc.category_id = @category.id
            @pc.score = data["0"][:score]
            binding.pry
            self.photo_categories << @pc
        end
        
    end
    
    #depends on order; assumes photo_categories already updated; BAD DESIGN
    def category_scores=(data)
        #binding.pry
        data.keys.each { |k|
            if @pc = self.photo_categories.find_by(category_id: k) 
               @pc.score = data[k][0]
               @pc.save
            end
        }
        
    end
    
    def get_category_score(category)
        self.photo_categories.find_by(category_id: category.id).score
    end
    
    mount_uploader :image, ImageUploader
    
end
