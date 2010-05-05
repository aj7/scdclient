class TaxonConcept < ActiveRecord::Base
  attr_accessible :comments, :taxon_name, :has_taxon_status, :rank, :is_current
  
  ###
  ### Plugins/Gems declarations
  ###
  acts_as_taggable
  acts_as_taggable_on :properties, :status_types, :taxon_ranks  #the  tags and tag lists
  acts_as_audited
  acts_as_nested_set

  ###
  ### Relationships
  ###

  #A TaxonConcept has got one TaxonName associated to it
  has_many :taxon_concept_names
  has_many :taxon_names, :through => :taxon_concept_names

end
