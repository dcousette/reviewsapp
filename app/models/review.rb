class Review < ActiveRecord::Base 
  belongs_to :restaurant
  belongs_to :user 
  validates_presence_of :rating, :content, :restaurant_id 
end
