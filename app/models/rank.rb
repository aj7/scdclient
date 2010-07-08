class Rank < ActiveRecord::Base
  ###
  ###Associations
  ###
  has_many :taxon_concepts

  ###
  ### Validations
  ###

  validates_presence_of :name

end
