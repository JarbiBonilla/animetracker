class User < ActiveRecord::Base
  has_many :shows 
  has_secure_password
  validates :email, uniqueness: true 
end
