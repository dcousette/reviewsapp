class Restaurant < ActiveRecord::Base 
  belongs_to :category
  has_many :reviews 
  validates_uniqueness_of :name, :description
  validates_presence_of :name, :description, :category_id 
  
  def review_exists_already?(restaurant, user)
    restaurant.reviews.reload.any? {|review| review[:user_id] == user.id }
  end
end

