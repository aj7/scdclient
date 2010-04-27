class NameRelationshipsController < InheritedResources::Base
   load_and_authorize_resource
  
  #Using InheritedResources doesnt require all the blurb - need to overwrite the specific actions if one wants more functionality
  respond_to :html, :xml, :json
end
