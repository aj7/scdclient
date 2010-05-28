module GenericMethods

  def self.included(controller)
    controller.send :helper_method, :add_tag, :delete_tag, :update_tag
    #controller.filter_parameter_logging :password, :password_confirmation
  end
  #adding a tag to the model, with the
  def GenericMethods.add_tag(model, tag, tag_list)
    t = model.constantize.find(:first)
    t.send("#{tag_list}_list").add(tag)
    #t.status_type_list.add(status)
    t.save
  end

  #The model is the name of the Model which has got the tags
  #The tag is the value of the tag being deleted
  #The tag_list is the name of the tag_list which has been given in the model e.g. status_type in TaxonConcept
  def GenericMethods.delete_tag (model, tag, tag_list)
    model.constantize.send("#{tag_list}_counts").find(:first, :conditions => {:name => tag}).delete
  end


  #old_tag is the name of the tag which will be updated
  #new_tag is the new name for the tag
  #model_field is the field which is storing the current instance of the tag e.g. for status_type in TaxonConcept, this is has_taxon_status
  def GenericMethods.update_tag (model, old_tag, new_tag, tag_list, model_field )
    #debugger
    taxons = model.constantize.send("find_all_by_#{model_field}",old_tag)
    taxons.each do |e|
      e.send("#{model_field}").to_sym = new_tag
      e.save
    end

   t = model.constantize.send("#{tag_list}_counts").find(:first,:conditions => {:name => old_tag},:readonly => false)
   t.name = new_tag
   t.save
  end

end