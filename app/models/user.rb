class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :lockable, :confirmable, :timeoutable and :activatable
  devise :registerable, :authenticatable,  :recoverable,
         :rememberable, :trackable, :validatable

#  attr_accessible :username, :email, :password
  has_many :assignments
  has_many :roles, :through => :assignments
  
  #accepts_nested_attributes_for :role, :reject_if => :all_blank

  def role?(role)
    self.roles.find(:first, :conditions => ["name = ?", role.to_s]).present?
  end
end
