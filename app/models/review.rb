class Review < ActiveRecord::Base 
  belongs_to :restaurant
  validates_presence_of :rating, :content, :restaurant_id 
  validates_uniqueness_of :restaurant_id
end
