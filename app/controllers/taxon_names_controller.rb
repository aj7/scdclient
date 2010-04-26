class TaxonNamesController < InheritedResources::Base
  load_and_authorize_resource #For Cancan

  respond_to :html, :xml, :json

end
