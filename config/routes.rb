Scdclient::Application.routes.draw do |map|
  resources :languages

  resources :common_names

  resources :taxon_concepts

  resources :roles
  resources :name_relationships

  resources :taxon_names

  resources :user_sessions
  resources :users

  match '/login', :to => 'user_sessions#new', :as => 'login'
  match "/logout", :to => "user_sessions#destroy", :as => 'logout'

  match "/add_comment", :to => "taxon_concepts#add_comment", :as => 'add_comment'
  match "/delete_comment", :to => "taxon_concepts#delete_comment", :as => 'delete_comment'

  match "create_tag/:controller" , :to => ':controller#create_tag', :as => 'create_tag'
  match "update_tag/:controller" , :to => ":controller#update_tag", :as => "update_tag"
  match "delete_tag/:controller" , :to => ":controller#delete_tag", :as => "delete_tag"
  #delete_tag "delete_tag/:controller" , :action => "delete_tag"
  #update_tag "update_tag/:controller" , :action => "update_tag"

  match "/create_common_name", :to => "taxon_concepts#create_common_name", :as => 'create_common_name'
  match "/update_common_name", :to => "taxon_concepts#update_common_name", :as => 'update_common_name'
  match "/delete_common_name", :to => "taxon_concepts#delete_common_name", :as => 'delete_common_name'
  #edit_common_name "edit_common_name", :controller => "taxon_concepts", :action => "edit_common_name"
  match "/get_common_names", :to => "common_names#get_common_names", :as => 'get_common_names'

  match "/create_taxon_rank", :to => "taxon_concepts#create_taxon_rank", :as => 'create_taxon_rank'
  match "/delete_taxon_rank", :to => "taxon_concepts#delete_taxon_rank", :as => 'delete_taxon_rank'
  match "/update_taxon_rank", :to => "taxon_concepts#update_taxon_rank", :as => 'update_taxon_rank'



  match '/home', :to => "home#index", :as => 'home'

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route ( HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route with more complex sub-resources
  #   resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with root -- just remember to delete public/index.html.
  # root :controller => "welcome"

  root :to => 'home#index'
  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  match '/:controller(/:action(/:id))'
  match '/:controller(/:action(/:id.:format))'
end
