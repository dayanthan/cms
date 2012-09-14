Authdemo::Application.routes.draw do

  resources :designations

  resources :roles

  resources :departments

  resources :managers

  resources :developers
  resources :messages

  resources :user_sessions
  resources :users
  resources :home
  # match "admin/login"=>"admin#login"
  #   get "admin/login"
   # match '/users/dotnet', :controller => 'users', :action => 'dotnet'

   # match "users/sendmessage"=>"users#sendmessage"
 # match '/users/sendmessage', :controller => 'users', :action => 'sendmessage'
  match 'messages/:sender_id/to/:receiver_id' => "messages#new", :as => :send_message
  match '/usermanagement' => "relationships#user_management", :as => :usermanagement
  get '/toggle_status/:id' => "users#status_toggle", :as => :status_toggle

 match 'logout' => "user_sessions#destroy", :as => :logout
  match '/user_sessions/new', :controller => 'user_sessions', :action => 'login'
   match '/admin/message', :controller => 'admin', :action => 'message'
   
   match '/users/edit', :controller => 'users', :action => 'edit'
   match '/users/show', :controller => 'users', :action => 'show'
    match '/users/message', :controller => 'users', :action => 'message'
     match '/admin/inbox', :controller => 'admin', :action => 'inbox'
   
   match '/admin/message', :controller => 'admin', :action => 'message'
   match '/admin/show', :controller => 'admin', :action => 'show'
   match '/admin/edit', :controller => 'admin', :action => 'edit'
   match '/admin/dotnet', :controller => 'admin', :action => 'dotnet'
   match '/admin/opensource', :controller => 'admin', :action => 'opensource'
   match '/admin/socialmedia', :controller => 'admin', :action => 'socialmedia'
   match '/admin/sendmessage', :controller => 'admin', :action => 'sendmessage'

     match '/admin/welcome',:controller=>"admin", :action=>"welcome"
   # match '/admin/message', :controller => 'admin', :action => 'message'
   # match '/departments/dotnet', :controller => 'departments', :action => 'dotnet'



   #  match '/departments/dotnet', :controller => 'departments', :action => 'dotnet'
   #   match '/departments/opensource', :controller => 'departments', :action => 'opensource'
   #    match '/departments/socialmedia', :controller => 'departments', :action => 'socialmedia'


    #match '/toggle_status' => "users#status_toggle", :as => :status_toggle
  resources :admin
# match '/home/news', :controller => 'home', :action => 'news'

# match '/apps/buy', :controller => 'apps', :action => 'buy'
# resources :apps

  root :to => 'home#index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
