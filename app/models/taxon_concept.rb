class TaxonConcept < ActiveRecord::Base
  attr_accessible :comments, :taxon_name, :has_taxon_status, :rank, :is_current
  
end
