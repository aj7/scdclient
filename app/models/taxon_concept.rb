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
  acts_as_commentable #used for comments management

  ###
  ### Relationships
  ###

  #A TaxonConcept has got one TaxonName associated to it ; but one TaxonName can belongs_to_many TaxonConcepts
  belongs_to :taxon_name
  has_many :concept_common_links
  has_many :common_names, :through => :concept_common_links

  ###
  ### Validations
  ###

  validates_presence_of :taxon_name , :has_taxon_status, :rank

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

  def delete_common_name (common_name)
    common_names.delete(common_name)
  end

  def update_common_name (params)
     @common_name = CommonName.find(params[:common_name_id])
     if (@common_name.update_attributes(params[:common_name]))

     end

  end
#  def add_tag (tag, method_value)
#    t = TaxonConcept.find(:first)
#    t.send("#{method_value}_list").add(tag)
#    #t.status_type_list.add(status)
#    t.save
#  end
#
#  def delete_tag (tag, method_value)
#    TaxonConcept.send("#{method_value}_counts").find(:first, :conditions => {:name => tag}).delete
#  end
#
#  def update_tag (old_tag, new_tag, method_value, model_field )
#    debugger
#    taxons = TaxonConcept.send("find_all_by_#{model_field}",old_tag)
#    taxons.each do |e|
#      e.send("#{model_field}").to_sym = new_tag
#      e.save
#    end
#
#   t = TaxonConcept.send("#{method_value}_counts").find(:first,:conditions => {:name => old_tag},:readonly => false)
#   t.name = new_tag
#   t.save
#  end

  def add_child (child)
     taxon_concept = TaxonConcept.find child
     taxon_concept.move_to_child_of(self)
    
  end

end
