class TaxonNamesController < ApplicationController
  def index
    @taxon_names = TaxonName.all
  end
  
  def show
    @taxon_name = TaxonName.find(params[:id])
  end
  
  def new
    @taxon_name = TaxonName.new
  end
  
  def create
    @taxon_name = TaxonName.new(params[:taxon_name])
    if @taxon_name.save
      flash[:notice] = "Successfully created taxon name."
      redirect_to @taxon_name
    else
      render :action => 'new'
    end
  end
  
  def edit
    @taxon_name = TaxonName.find(params[:id])
  end
  
  def update
    @taxon_name = TaxonName.find(params[:id])
    if @taxon_name.update_attributes(params[:taxon_name])
      flash[:notice] = "Successfully updated taxon name."
      redirect_to @taxon_name
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @taxon_name = TaxonName.find(params[:id])
    @taxon_name.destroy
    flash[:notice] = "Successfully destroyed taxon name."
    redirect_to taxon_names_url
  end
end
