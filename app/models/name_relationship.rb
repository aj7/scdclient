class NameRelationship < ActiveRecord::Base
  #attr_accessible :taxon_name_from_id, :taxon_name_to_id, :date_enforced, :relationship_type
  ###
  ### gems
  ###
  acts_as_taggable_on :taxon_name_relationship_type


  ###
  ### Relationships
  ###

  belongs_to :relatedFrom , :class_name => 'TaxonName', :foreign_key => :taxon_name_from_id
  belongs_to :relatedTo , :class_name => 'TaxonName', :foreign_key => :taxon_name_to_id


  #Same names can be part of multiple TaxonNames
  has_many :taxon_name_relationships
  has_many :taxon_names, :through => :taxon_name_relationships
end
