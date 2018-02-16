class Park < ApplicationRecord

has_many :photos

scope :popular2, -> { where(id: 1) }

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
    Park.joins(:photos)
end

end
