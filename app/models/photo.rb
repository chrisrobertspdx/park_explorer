class Photo < ApplicationRecord
    
    belongs_to :park
    belongs_to :user
    
    has_many :photo_categories
    has_many :categories, :through => :photo_categories
    
    
    
end
