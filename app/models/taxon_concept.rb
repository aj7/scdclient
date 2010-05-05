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

  has_one :hasTaxonName, :class_name => 'TaxonName', :foreign_key => :taxon_name_id #A TaxonConcept has got one TaxonName associated to it

end
