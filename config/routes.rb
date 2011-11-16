Specializ::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  #post '/users', :to => 'users#create'
  devise_for :users, :path_names => { :sign_up => 'register' }
  #devise_for :users, :controllers => {:registrations => 'registrations'}, :path_names => { :sign_up => 'register' }
  #devise_scope :user do
  #  get '/login' => 'devise/sessions#new'
  #  get '/logout' => 'devise/sessions#destroy'
  #end

  match '/me', :to => 'me#home'
  match '/manager', :to => 'topics#new'
  match '/hr', :to => 'groupings#new'
  match '/admin', :to => 'pages#admin'
  match '/company_admin', :to => 'users#index'
  match '/pages/me', :to => 'pages#me'
  match '/elements/rate_elements', :to => 'elements#rate_elements'
  match '/topic_groups/import_elements', :to => 'topic_groups#import_elements'
  match '/topic_groups/assign_topic', :to => 'topic_groups#assign_topic'
  match '/topic_groups/staff_topic', :to => 'topic_groups#staff_topic'
  match '/topic_groups/:topic_group_id/iterations/:id/close', :to => 'iterations#close'
  match '/topic_groups/:topic_group_id/iterations/:id/start', :to => 'iterations#start'
  post '/topics', :to => 'topics#create'
  match '/topics', :to => 'topics#edit'
  post '/groupings', :to => 'groupings#create'
  match '/groupings', :to => 'groupings#edit'
  match '/groupings/:grouping_id/users/:id/remove_user', :to => 'groupings#remove_user'
  match '/groupings/:id/new_user', :to => 'groupings#new_user'
  match '/groupings/:id/add_user', :to => 'groupings#add_user'
   
  resources :topic_groups do
    resources :iterations do
      post 'close'
      post 'start'
      resources :elements 
    end
  end
  
  resources :topics do
    resources :assignments do
      get :autocomplete_user_last_name, :on => :collection
    end
  end
  
  resources :groupings do
    get :autocomplete_user_last_name, :on => :collection
    resources :users 
    
  end
  
  resources :users do
    #get :autocomplete_company_name, :on => :collection
  end
  
  resources :me, :elements, :iterations, :assignments, :topic_groups, :topics, :users, :groupings, :companies, :elements
  
  root :to => 'me#home'


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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
