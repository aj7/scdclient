class User < ActiveRecord::Base
  acts_as_authentic 

#  attr_accessible :username, :email, :password
  has_many :assignments
  has_many :roles, :through => :assignments
  has_many :comments
  has_many :common_names
  has_many :languages

  #accepts_nested_attributes_for :role, :reject_if => :all_blank

  def role?(role)
    self.roles.find(:first, :conditions => ["name = ?", role.to_s]).present?
  end
end
