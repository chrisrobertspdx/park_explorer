class Park < ApplicationRecord

validates :name, presence: true, uniqueness: true

has_many :photos
has_many :photo_categories, through: :photos
has_many :users, through: :photos


scope :photogenic, -> {
    joins(:photos).group("parks.id").having("count(parks.id)> ?", 2)
  }

def get_cat_score(category)
    score = 0;
    self.photos.each { |p|
        p.photo_categories.each { |pc|
            if pc.category_id == category.id
                score += pc.score
            end
        }
    }
    score
end

def self.popular
   popular = []
   self.all.each {|e|
       if e.photos.size > 1
          popular << e 
       end
   }
   popular
end

def self.multiphoto
    #Photo.select("park_id, count(id) as thecount").group("park_id").having("count(id)> ?", 1)
    #Park.joins(:photos).select("id, count(id) as thecount").group("id").having("count(id)> ?", 1)
    Park.joins(:photos).group("parks.id").having("count(parks.id)> ?", 1)
end

end
