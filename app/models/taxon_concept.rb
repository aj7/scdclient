class TaxonConcept < ActiveRecord::Base
  #attr_accessible :comments, :has_taxon_status, :rank, :is_current
  
  ###
  ### Plugins/Gems declarations
  ###
  acts_as_taggable
  acts_as_taggable_on :properties, :status_types , :taxon_ranks  #the  tags and tag lists
  acts_as_audited
  acts_as_nested_set

  ###
  ### Relationships
  ###

  #A TaxonConcept has got one TaxonName associated to it ; but one TaxonName can belongs_to_many TaxonConcepts
  belongs_to :taxon_name

  ###
  ### Validations
  ###

  validates_presence_of :taxon_name , :has_taxon_status
end
