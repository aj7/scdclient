class TaxonNameRelationship < ActiveRecord::Base
  #attr_accessible :taxon_name, :name_relationship
  ###
  ### Relationships
  ###

  belongs_to :taxon_name        #the TaxonName
  belongs_to :name_relationship #will be related to multiple names
end
