class Rank < ActiveRecord::Base
  acts_as_list 
  ###
  ###contains
  ###

  ###
  ###Associations
  ###
  has_many :taxon_concepts

  ###
  ### Validations
  ###

  validates_presence_of :name
  validates_uniqueness_of :name, :message => "Rank already exists!"

  ###
  ###Scopes
  ###
  scope :display_by_position, order('position ASC')

end
