class Category < ApplicationRecord
    has_many :photo_categories
    has_many :photos, :through => :photo_categories
    validates :name, presence: true, uniqueness: true
end
