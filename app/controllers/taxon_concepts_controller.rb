class TaxonConceptsController < InheritedResources::Base
  respond_to :html, :xml, :json

  def update
    update! {taxon_concepts_path}
  end
end


