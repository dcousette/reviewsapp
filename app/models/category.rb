class Category < ActiveRecord::Base
  include Sluggable
  has_many :restaurants
  validates :name, presence: true, uniqueness: true
end
