class TaxonName < ActiveRecord::Base
  attr_accessible :scientific_name, :basionym_authorship, :authorship_year, :basionym_id, :is_usable, :alternative_authorship_year, :genus_part, :epithet, :infra_epithet
  ###
  ### Plugins/Gems declarations
  ###
  acts_as_taggable
  acts_as_taggable_on :properties
  acts_as_audited
 

  ###
  #Relationships
  ###

  belongs_to :basionym , :class_name => 'TaxonName' #TaxonName can be the basionym of another TaxonName
  has_many :BasionymFors , :class_name => 'TaxonName' , :foreign_key => :basionym_id #One TaxonName is a basionym for many other TaxonNames
  belongs_to :taxon_concept #A TaxonName belongs to one TaxonConcept (or more)

  #One TaxonName has a set of name relationships
  has_many :taxon_name_relationships
  has_many :name_relationships, :through => :taxon_name_relationships


  ###
  ###   Validations
  ###
  validates_presence_of :scientific_name

end
