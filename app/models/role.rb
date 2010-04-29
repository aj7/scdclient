class Role < ActiveRecord::Base
  attr_accessible :name, :description
  #
  #Relationships
  #
 has_many :assignments
 has_many :users, :through => :assignments

  #
  #Rules
  #
  validates_uniqueness_of :name,  :message => "Role with similar name already exists!"
end
