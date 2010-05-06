class TaxonConceptsController < ApplicationController
  def index
    @taxon_concepts = TaxonConcept.all
  end
  
  def show
    @taxon_concept = TaxonConcept.find(params[:id])
  end
  
  def new
    @taxon_concept = TaxonConcept.new
  end
  
  def create
    @taxon_concept = TaxonConcept.new(params[:taxon_concept])
    if @taxon_concept.save
      flash[:notice] = "Successfully created taxon concept."
      redirect_to @taxon_concept
    else
      render :action => 'new'
    end
  end
  
  def edit
    @taxon_concept = TaxonConcept.find(params[:id])
  end
  
  def update
    @taxon_concept = TaxonConcept.find(params[:id])
    if @taxon_concept.update_attributes(params[:taxon_concept])
      flash[:notice] = "Successfully updated taxon concept."
      redirect_to @taxon_concept
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @taxon_concept = TaxonConcept.find(params[:id])
    @taxon_concept.destroy
    flash[:notice] = "Successfully destroyed taxon concept."
    redirect_to taxon_concepts_url
  end
end
