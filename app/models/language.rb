class Language < ActiveRecord::Base
  attr_accessible :name, :description

  ###
  ###Relationships
  ###
  has_one :common_name
  belongs_to :user

  ###
  ### Validations
  ###

  validates_uniqueness_of :name

end
