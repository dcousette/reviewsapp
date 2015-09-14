class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews 
  validates_presence_of :username, :password
  validates_uniqueness_of :username 
end

