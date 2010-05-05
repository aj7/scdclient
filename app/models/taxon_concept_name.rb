class TaxonConceptName < ActiveRecord::Base
  attr_accessible :references, :references

  ###
  ###Relationships
  ###
  belongs_to :taxon_concept
  belongs_to :taxon_name
end
