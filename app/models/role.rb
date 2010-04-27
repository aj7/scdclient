class Role < ActiveRecord::Base
  attr_accessible :name, :description
  #
  #Relationships
  #
 has_many :assignments
 has_many :users, :through => :assignments
end
