class Restaurant < ActiveRecord::Base 
  belongs_to :category
  validates_uniqueness_of :name
  validates_presence_of :name, :description, :category
end