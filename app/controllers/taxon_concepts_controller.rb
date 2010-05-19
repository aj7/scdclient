class TaxonConceptsController < InheritedResources::Base
  respond_to :html, :xml, :json

  def update
    update! {taxon_concepts_path}
  end

  def create_status
    #debugger
    @status = params[:taxon_concept][:has_taxon_status]
    TaxonConcept.first.add_status @status
    respond_to do |format|
      format.html {redirect_to taxon_concepts_path}
      format.js
    end
  end

  def delete_status
    #debugger
    @status = params[:status]
    TaxonConcept.try(:first).delete_status @status      
    flash[:notice] = @status + " status has been deleted!"
    respond_to do |format|
      format.html {redirect_to taxon_concepts_path}
      format.js
    end
  end
  
  def update_status
    debugger
    TaxonConcept.try(:first).update_status(params[:old_status][:value], params[:new_status])
     flash[:notice] =  " Status has been updated!"
    respond_to do |format|
      format.html {redirect_to taxon_concepts_path}
      format.js
    end
  end
end


