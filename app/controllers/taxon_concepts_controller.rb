class TaxonConceptsController < InheritedResources::Base
  respond_to :html, :xml, :json

  def update
    update! {taxon_concepts_path}
  end

  def create_status
    @status = params[:status]
    TaxonConcept.first.add_status @status
     respond_to do |format|
        format.html {redirect_to roles_path}
        format.js
      end
  end
end


