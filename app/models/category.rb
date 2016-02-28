class Category < ActiveRecord::Base
  include Sluggable
  has_many :restaurants
  validates :name, :slug, presence: true, uniqueness: true
end
