class Category < ActiveRecord::Base
  has_many :restaurants
  validates :name, presence: true, uniqueness: true 
end
