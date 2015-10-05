class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews, -> { order('created_at DESC')}
  validates_presence_of :username, :password
  validates_uniqueness_of :username 
end

