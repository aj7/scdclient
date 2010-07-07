ActionController::Routing::Routes.draw do |map|
  map.resources :languages

  map.resources :common_names

  map.resources :taxon_concepts

  map.resources :roles
  map.resources :name_relationships

  map.resources :taxon_names

  map.resources :user_sessions
  map.resources :users

  map.login "login", :controller => "user_sessions", :action => "new"
  map.logout "logout", :controller => "user_sessions", :action => "destroy"

  map.add_comment "add_comment", :controller => "taxon_concepts", :action => "add_comment"
  map.delete_comment "delete_comment", :controller => "taxon_concepts", :action => "delete_comment"

  map.create_tag "create_tag/:controller" , :action => "create_tag"
  map.delete_tag "delete_tag/:controller" , :action => "delete_tag"
  map.update_tag "update_tag/:controller" , :action => "update_tag"

  map.create_common_name "create_common_name", :controller => "taxon_concepts", :action => "create_common_name"
  map.update_common_name "update_common_name", :controller => "taxon_concepts", :action => "update_common_name"
  map.delete_common_name "delete_common_name", :controller => "taxon_concepts", :action => "delete_common_name"
  #map.edit_common_name "edit_common_name", :controller => "taxon_concepts", :action => "edit_common_name"
  map.get_common_names "get_common_names", :controller => "common_names", :action => "get_common_names"

  map.create_taxon_rank "create_taxon_rank", :controller => "taxon_concepts", :action => "create_taxon_rank"
  map.delete_taxon_rank "delete_taxon_rank", :controller => "taxon_concepts", :action => "delete_taxon_rank"
  map.update_taxon_rank "update_taxon_rank", :controller => "taxon_concepts", :action => "update_taxon_rank"



  map.home 'home', :controller => "home" ,:action =>"index"

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  map.root :home
  #map.root 'public/enter/hello.html'
  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
