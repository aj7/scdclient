class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :lockable, :confirmable, :timeoutable and :activatable
  devise :registerable, :authenticatable,  :recoverable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation

  #
  #Relationships
  #
  has_many :assignments
  has_many :roles, :through => :assignments
  
end
