class Assignment < ActiveRecord::Base
  #attr_accessible :role, :user

  #
  #Relationships
  #
  belongs_to :role
  belongs_to :user
end
