class NameRelationshipsController < InheritedResources::Base
  load_and_authorize_resource #for Cancan

  respond_to :html, :xml, :json

end
