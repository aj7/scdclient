class NameRelationshipsController < ApplicationController
  def index
    @name_relationships = NameRelationship.all
  end
  
  def show
    @name_relationship = NameRelationship.find(params[:id])
  end
  
  def new
    @name_relationship = NameRelationship.new
  end
  
  def create
    @name_relationship = NameRelationship.new(params[:name_relationship])
    if @name_relationship.save
      flash[:notice] = "Successfully created name relationship."
      redirect_to @name_relationship
    else
      render :action => 'new'
    end
  end
  
  def edit
    @name_relationship = NameRelationship.find(params[:id])
  end
  
  def update
    @name_relationship = NameRelationship.find(params[:id])
    if @name_relationship.update_attributes(params[:name_relationship])
      flash[:notice] = "Successfully updated name relationship."
      redirect_to @name_relationship
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @name_relationship = NameRelationship.find(params[:id])
    @name_relationship.destroy
    flash[:notice] = "Successfully destroyed name relationship."
    redirect_to name_relationships_url
  end
end
