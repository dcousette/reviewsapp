class Review < ActiveRecord::Base 
  belongs_to :restaurant
  validates_presence_of :rating, :content, :restaurant_id 
end
