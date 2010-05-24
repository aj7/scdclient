class TaxonConceptsController < InheritedResources::Base
  respond_to :html, :xml, :json , :js

  def update
    update! {taxon_concepts_path}
  end

  def create_status
    debugger
    @status = params[:new_tag]
    TaxonConcept.try(:first).add_status @status
    respond_to do |format|
      format.html {redirect_to taxon_concepts_path}
      format.js
    end
  end

  def delete_status
    #debugger
    @status = params[:delete_tag]
    TaxonConcept.try(:first).delete_status @status      
    #flash[:notice] = @status + " status has been deleted!"
    respond_to do |format|
      format.html {redirect_to taxon_concepts_path}
      format.js
    end
  end
  
  def update_status
    #debugger
    TaxonConcept.try(:first).update_status(params[:old_tag], params[:new_tag])
     #flash[:notice] =  " Status has been updated!"
    respond_to do |format|
      format.html {redirect_to taxon_concepts_path}
      format.js
    end
  end

  def create_tag
    debugger
    @status = params[:new_tag]
    GenericMethods.add_tag "TaxonConcept",params[:new_tag], params[:tag_list]
    #TaxonConcept.try(:first).add_status @status
    respond_to do |format|
      format.html {redirect_to taxon_concepts_path}
      format.js
    end
  end

  def delete_tag
    #debugger
    @status = params[:delete_tag]
    TaxonConcept.try(:first).delete_status @status
    #flash[:notice] = @status + " status has been deleted!"
    respond_to do |format|
      format.html {redirect_to taxon_concepts_path}
      format.js
    end
  end

  def update_tag
    #debugger
    TaxonConcept.try(:first).update_status(params[:old_tag], params[:new_tag])
     #flash[:notice] =  " Status has been updated!"
    respond_to do |format|
      format.html {redirect_to taxon_concepts_path}
      format.js
    end
  end
end


