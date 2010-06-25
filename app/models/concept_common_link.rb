class ConceptCommonLink < ActiveRecord::Base
  ###
  ###Relationships
  ###

  #link table for a TaxonConcept having many commonnames
  belongs_to :common_name
  belongs_to :taxon_concept
end
