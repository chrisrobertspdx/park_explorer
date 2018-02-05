class Photo < ApplicationRecord
    
    belongs_to :park
    belongs_to :user
    
    has_many :categories, :through => :photo_categories
    
    accepts_nested_attributes_for :categories
    
end
