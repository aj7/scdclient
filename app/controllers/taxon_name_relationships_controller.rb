class TaxonNameRelationshipsController < ApplicationController
  def index
    @taxon_name_relationships = TaxonNameRelationship.all
  end
  
  def show
    @taxon_name_relationship = TaxonNameRelationship.find(params[:id])
  end
  
  def new
    @taxon_name_relationship = TaxonNameRelationship.new
  end
  
  def create
    @taxon_name_relationship = TaxonNameRelationship.new(params[:taxon_name_relationship])
    if @taxon_name_relationship.save
      flash[:notice] = "Successfully created taxon name relationship."
      redirect_to @taxon_name_relationship
    else
      render :action => 'new'
    end
  end
  
  def edit
    @taxon_name_relationship = TaxonNameRelationship.find(params[:id])
  end
  
  def update
    @taxon_name_relationship = TaxonNameRelationship.find(params[:id])
    if @taxon_name_relationship.update_attributes(params[:taxon_name_relationship])
      flash[:notice] = "Successfully updated taxon name relationship."
      redirect_to @taxon_name_relationship
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @taxon_name_relationship = TaxonNameRelationship.find(params[:id])
    @taxon_name_relationship.destroy
    flash[:notice] = "Successfully destroyed taxon name relationship."
    redirect_to taxon_name_relationships_url
  end
end
