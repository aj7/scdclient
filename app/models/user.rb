class User < ActiveRecord::Base
  acts_as_authentic 

#  attr_accessible :username, :email, :password
  has_many :assignments
  has_many :roles, :through => :assignments
  
  accepts_nested_attributes_for :role
end
