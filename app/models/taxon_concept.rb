class TaxonConcept < ActiveRecord::Base
  #attr_accessible :comments, :has_taxon_status, :rank, :is_current

  ###
  ### Plugins/Gems declarations
  ###
  acts_as_taggable
  acts_as_taggable_on :properties, :status_types , :taxon_ranks  #the  tags and tag lists
  acts_as_audited
  acts_as_nested_set
  has_paper_trail #used for versioning

  ###
  ### Relationships
  ###

  #A TaxonConcept has got one TaxonName associated to it ; but one TaxonName can belongs_to_many TaxonConcepts
  belongs_to :taxon_name

  ###
  ### Validations
  ###

  validates_presence_of :taxon_name , :has_taxon_status

  def add_status status
    t = TaxonConcept.find(:first)
    t.status_type_list.add(status)
    t.save
  end

  def delete_status  status
    TaxonConcept.status_type_counts.find(:first, :conditions => {:name => status}).delete
  end
  
  def update_status (old_status , new_status)
    debugger
    taxons = TaxonConcept.find_all_by_has_taxon_status(old_status)
    taxons.each do |e|
      e.has_taxon_status = new_status
      e.save
    end
    
   t = TaxonConcept.status_type_counts.find(:first,:conditions => {:name => old_status},:readonly => false)
   t.name = new_status
   t.save
  end

end
