class Assignment < ActiveRecord::Base
  attr_accessible :role, :user
  
  #
  #Relationships
  belongs_to :user
  belongs_to :role
  #
end
