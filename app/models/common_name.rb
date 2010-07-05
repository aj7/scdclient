class CommonName < ActiveRecord::Base
  attr_accessible  :name, :preferred , :language_id

  ###
  ###Relationships
  ###
  has_many :concept_common_links
  has_many :taxon_concepts, :through => :concept_common_links
  belongs_to :language
  belongs_to :user

  ###
  ### Plugins/Gems declarations
  ###
  acts_as_taggable
  acts_as_taggable_on :properties, :languages  #the  tags and tag lists
  #acts_as_audited - doesn't work in rails3
  has_paper_trail #used for versioning

end
