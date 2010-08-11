class SearchController < ApplicationController

  def search_taxon
    #debugger

    if (params[:term])
      @taxons = (TaxonConcept.search params[:term], :star => true, :match_mode => :boolean)
    else
      @taxons = TaxonConcept.all
    end

    @json =  @taxons.each_with_object([]) {|obj, hash|
        taxon = { :name => obj.taxon_name.scientific_name, :rank =>  obj.rank.try(:name) }
        hash << taxon
      }

    #debugger
    render :json => @json
  end

end