Specializ::Application.routes.draw do

  ActiveAdmin.routes(self)

  match '/auth/:provider/callback' => 'authentications#create'
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, :controllers => {:registrations => 'registrations'}, :path_prefix => 'd' 
  resources :authentications

  match '/me', :to => 'me#home'
  match '/manager', :to => 'topics#new'
  match '/hr', :to => 'groupings#new'
  match '/admin', :to => 'pages#admin'
  match '/company_admin', :to => 'users#index'
  match '/pages/me', :to => 'pages#me'
  match '/topic_groups/import_elements', :to => 'topic_groups#import_elements'
  match '/topic_groups/assign_topic', :to => 'topic_groups#assign_topic'
  match '/topics/staff_topic', :to => 'topics#staff_topic'
  post '/topics', :to => 'topics#create'
  match '/topics/new', :to => 'topics#new'
  match '/topics', :to => 'topics#edit'
  get '/topics/:id', :to => 'topics#edit'
  post '/groupings', :to => 'groupings#create'
  match '/groupings/new', :to => 'groupings#new'
  match '/groupings', :to => 'groupings#edit'
  match '/groupings/:id/new_user', :to => 'groupings#new_user'
  match '/groupings/:id/add_user', :to => 'groupings#add_user'
  match '/groupings/import_groups', :to => 'groupings#import_groups'
  match '/auth/failure', :to => 'authentications#auth_fail'
  match '/users/import_users', :to => 'users#import_users'
  match '/users/rate_elements', :to => 'users#rate_elements'
  match '/users/approve_new_elements', :to => 'users#approve_new_elements'
  match '/me/event_list/:date', :to => 'me#event_list'
  match '/me/events', :to => 'me#events'
  get '/companies/:id', :to => 'companies#edit'
  match '/libraries/import_libraries', :to => 'libraries#import_libraries'
  match '/libraries/import_objectives', :to => 'libraries#import_objectives'
   
  resources :topic_groups do
    match 'assign_libraries', :to => 'topics_groups#assign_libraries'
    match 'participants', :to => 'topic_groups#participants'
    #match 'survey', :to => 'topic_groups#survey'
    resources :assignments
    post 'close', :to => 'topic_groups#close'
    post 'export', :to => 'topic_groups#export_elements'
    resources :iterations do
      post 'close', :to => 'iterations#close'
      post 'start', :to => 'iterations#start'
      match 'participants', :to => 'topic_groups#participants'
      resources :elements do
        match 'description', :to => 'elements#description'
        resources :element_attributes
      end
    end
  end
  
  resources :topics do
    #match 'assigned_participants', :to => 'topics#assigned_participants'
    match 'assign_libraries', :to => 'topics#assign_libraries'
    resources :topic_groups
    resources :assignments do
      get :autocomplete_user_last_name, :on => :collection
    end
  end
  
  resources :groupings do
    get :autocomplete_user_last_name, :on => :collection
    resources :users do
      post 'remove', :to => 'groupings#remove'
    end 
  end
  
  resources :users do
    get :autocomplete_company_name, :on => :collection
    #post 'import_users', :to => 'users#import_users'
  end
  
  resources :elements do
    match 'description', :to => 'elements#description'
  end
  resources :element_attributes
  
  resources :ajax do
    get :autocomplete_company_name, :on => :collection, :full => true
  end
  
  resources :libraries do
    resources :library_objectives
  end
  resources :ldap_settings
  resources :companies
  resources :assignments
  
  root :to => 'me#home'

end
#== Route Map
# Generated on 27 Jun 2012 15:06
#
#                                       admin_comments GET        /admin/comments(.:format)                                                                                         {:action=>"index", :controller=>"admin/comments"}
#                                                      POST       /admin/comments(.:format)                                                                                         {:action=>"create", :controller=>"admin/comments"}
#                                    new_admin_comment GET        /admin/comments/new(.:format)                                                                                     {:action=>"new", :controller=>"admin/comments"}
#                                   edit_admin_comment GET        /admin/comments/:id/edit(.:format)                                                                                {:action=>"edit", :controller=>"admin/comments"}
#                                        admin_comment GET        /admin/comments/:id(.:format)                                                                                     {:action=>"show", :controller=>"admin/comments"}
#                                                      PUT        /admin/comments/:id(.:format)                                                                                     {:action=>"update", :controller=>"admin/comments"}
#                                                      DELETE     /admin/comments/:id(.:format)                                                                                     {:action=>"destroy", :controller=>"admin/comments"}
#                                          admin_users GET        /admin/users(.:format)                                                                                            {:action=>"index", :controller=>"admin/users"}
#                                                      POST       /admin/users(.:format)                                                                                            {:action=>"create", :controller=>"admin/users"}
#                                       new_admin_user GET        /admin/users/new(.:format)                                                                                        {:action=>"new", :controller=>"admin/users"}
#                                      edit_admin_user GET        /admin/users/:id/edit(.:format)                                                                                   {:action=>"edit", :controller=>"admin/users"}
#                                           admin_user GET        /admin/users/:id(.:format)                                                                                        {:action=>"show", :controller=>"admin/users"}
#                                                      PUT        /admin/users/:id(.:format)                                                                                        {:action=>"update", :controller=>"admin/users"}
#                                                      DELETE     /admin/users/:id(.:format)                                                                                        {:action=>"destroy", :controller=>"admin/users"}
#                                         admin_topics GET        /admin/topics(.:format)                                                                                           {:action=>"index", :controller=>"admin/topics"}
#                                                      POST       /admin/topics(.:format)                                                                                           {:action=>"create", :controller=>"admin/topics"}
#                                      new_admin_topic GET        /admin/topics/new(.:format)                                                                                       {:action=>"new", :controller=>"admin/topics"}
#                                     edit_admin_topic GET        /admin/topics/:id/edit(.:format)                                                                                  {:action=>"edit", :controller=>"admin/topics"}
#                                          admin_topic GET        /admin/topics/:id(.:format)                                                                                       {:action=>"show", :controller=>"admin/topics"}
#                                                      PUT        /admin/topics/:id(.:format)                                                                                       {:action=>"update", :controller=>"admin/topics"}
#                                                      DELETE     /admin/topics/:id(.:format)                                                                                       {:action=>"destroy", :controller=>"admin/topics"}
#                                    admin_admin_users GET        /admin/admin_users(.:format)                                                                                      {:action=>"index", :controller=>"admin/admin_users"}
#                                                      POST       /admin/admin_users(.:format)                                                                                      {:action=>"create", :controller=>"admin/admin_users"}
#                                 new_admin_admin_user GET        /admin/admin_users/new(.:format)                                                                                  {:action=>"new", :controller=>"admin/admin_users"}
#                                edit_admin_admin_user GET        /admin/admin_users/:id/edit(.:format)                                                                             {:action=>"edit", :controller=>"admin/admin_users"}
#                                     admin_admin_user GET        /admin/admin_users/:id(.:format)                                                                                  {:action=>"show", :controller=>"admin/admin_users"}
#                                                      PUT        /admin/admin_users/:id(.:format)                                                                                  {:action=>"update", :controller=>"admin/admin_users"}
#                                                      DELETE     /admin/admin_users/:id(.:format)                                                                                  {:action=>"destroy", :controller=>"admin/admin_users"}
#                                      admin_groupings GET        /admin/groupings(.:format)                                                                                        {:action=>"index", :controller=>"admin/groupings"}
#                                                      POST       /admin/groupings(.:format)                                                                                        {:action=>"create", :controller=>"admin/groupings"}
#                                   new_admin_grouping GET        /admin/groupings/new(.:format)                                                                                    {:action=>"new", :controller=>"admin/groupings"}
#                                  edit_admin_grouping GET        /admin/groupings/:id/edit(.:format)                                                                               {:action=>"edit", :controller=>"admin/groupings"}
#                                       admin_grouping GET        /admin/groupings/:id(.:format)                                                                                    {:action=>"show", :controller=>"admin/groupings"}
#                                                      PUT        /admin/groupings/:id(.:format)                                                                                    {:action=>"update", :controller=>"admin/groupings"}
#                                                      DELETE     /admin/groupings/:id(.:format)                                                                                    {:action=>"destroy", :controller=>"admin/groupings"}
#                                     admin_iterations GET        /admin/iterations(.:format)                                                                                       {:action=>"index", :controller=>"admin/iterations"}
#                                                      POST       /admin/iterations(.:format)                                                                                       {:action=>"create", :controller=>"admin/iterations"}
#                                  new_admin_iteration GET        /admin/iterations/new(.:format)                                                                                   {:action=>"new", :controller=>"admin/iterations"}
#                                 edit_admin_iteration GET        /admin/iterations/:id/edit(.:format)                                                                              {:action=>"edit", :controller=>"admin/iterations"}
#                                      admin_iteration GET        /admin/iterations/:id(.:format)                                                                                   {:action=>"show", :controller=>"admin/iterations"}
#                                                      PUT        /admin/iterations/:id(.:format)                                                                                   {:action=>"update", :controller=>"admin/iterations"}
#                                                      DELETE     /admin/iterations/:id(.:format)                                                                                   {:action=>"destroy", :controller=>"admin/iterations"}
#                                       admin_elements GET        /admin/elements(.:format)                                                                                         {:action=>"index", :controller=>"admin/elements"}
#                                                      POST       /admin/elements(.:format)                                                                                         {:action=>"create", :controller=>"admin/elements"}
#                                    new_admin_element GET        /admin/elements/new(.:format)                                                                                     {:action=>"new", :controller=>"admin/elements"}
#                                   edit_admin_element GET        /admin/elements/:id/edit(.:format)                                                                                {:action=>"edit", :controller=>"admin/elements"}
#                                        admin_element GET        /admin/elements/:id(.:format)                                                                                     {:action=>"show", :controller=>"admin/elements"}
#                                                      PUT        /admin/elements/:id(.:format)                                                                                     {:action=>"update", :controller=>"admin/elements"}
#                                                      DELETE     /admin/elements/:id(.:format)                                                                                     {:action=>"destroy", :controller=>"admin/elements"}
#                             admin_library_objectives GET        /admin/library_objectives(.:format)                                                                               {:action=>"index", :controller=>"admin/library_objectives"}
#                                                      POST       /admin/library_objectives(.:format)                                                                               {:action=>"create", :controller=>"admin/library_objectives"}
#                          new_admin_library_objective GET        /admin/library_objectives/new(.:format)                                                                           {:action=>"new", :controller=>"admin/library_objectives"}
#                         edit_admin_library_objective GET        /admin/library_objectives/:id/edit(.:format)                                                                      {:action=>"edit", :controller=>"admin/library_objectives"}
#                              admin_library_objective GET        /admin/library_objectives/:id(.:format)                                                                           {:action=>"show", :controller=>"admin/library_objectives"}
#                                                      PUT        /admin/library_objectives/:id(.:format)                                                                           {:action=>"update", :controller=>"admin/library_objectives"}
#                                                      DELETE     /admin/library_objectives/:id(.:format)                                                                           {:action=>"destroy", :controller=>"admin/library_objectives"}
#                                      admin_companies GET        /admin/companies(.:format)                                                                                        {:action=>"index", :controller=>"admin/companies"}
#                                                      POST       /admin/companies(.:format)                                                                                        {:action=>"create", :controller=>"admin/companies"}
#                                    new_admin_company GET        /admin/companies/new(.:format)                                                                                    {:action=>"new", :controller=>"admin/companies"}
#                                   edit_admin_company GET        /admin/companies/:id/edit(.:format)                                                                               {:action=>"edit", :controller=>"admin/companies"}
#                                        admin_company GET        /admin/companies/:id(.:format)                                                                                    {:action=>"show", :controller=>"admin/companies"}
#                                                      PUT        /admin/companies/:id(.:format)                                                                                    {:action=>"update", :controller=>"admin/companies"}
#                                                      DELETE     /admin/companies/:id(.:format)                                                                                    {:action=>"destroy", :controller=>"admin/companies"}
#                                      admin_libraries GET        /admin/libraries(.:format)                                                                                        {:action=>"index", :controller=>"admin/libraries"}
#                                                      POST       /admin/libraries(.:format)                                                                                        {:action=>"create", :controller=>"admin/libraries"}
#                                    new_admin_library GET        /admin/libraries/new(.:format)                                                                                    {:action=>"new", :controller=>"admin/libraries"}
#                                   edit_admin_library GET        /admin/libraries/:id/edit(.:format)                                                                               {:action=>"edit", :controller=>"admin/libraries"}
#                                        admin_library GET        /admin/libraries/:id(.:format)                                                                                    {:action=>"show", :controller=>"admin/libraries"}
#                                                      PUT        /admin/libraries/:id(.:format)                                                                                    {:action=>"update", :controller=>"admin/libraries"}
#                                                      DELETE     /admin/libraries/:id(.:format)                                                                                    {:action=>"destroy", :controller=>"admin/libraries"}
#                                   admin_topic_groups GET        /admin/topic_groups(.:format)                                                                                     {:action=>"index", :controller=>"admin/topic_groups"}
#                                                      POST       /admin/topic_groups(.:format)                                                                                     {:action=>"create", :controller=>"admin/topic_groups"}
#                                new_admin_topic_group GET        /admin/topic_groups/new(.:format)                                                                                 {:action=>"new", :controller=>"admin/topic_groups"}
#                               edit_admin_topic_group GET        /admin/topic_groups/:id/edit(.:format)                                                                            {:action=>"edit", :controller=>"admin/topic_groups"}
#                                    admin_topic_group GET        /admin/topic_groups/:id(.:format)                                                                                 {:action=>"show", :controller=>"admin/topic_groups"}
#                                                      PUT        /admin/topic_groups/:id(.:format)                                                                                 {:action=>"update", :controller=>"admin/topic_groups"}
#                                                      DELETE     /admin/topic_groups/:id(.:format)                                                                                 {:action=>"destroy", :controller=>"admin/topic_groups"}
#                                                                 /auth/:provider/callback(.:format)                                                                                {:controller=>"authentications", :action=>"create"}
#                               new_admin_user_session GET        /admin/login(.:format)                                                                                            {:action=>"new", :controller=>"active_admin/devise/sessions"}
#                                   admin_user_session POST       /admin/login(.:format)                                                                                            {:action=>"create", :controller=>"active_admin/devise/sessions"}
#                           destroy_admin_user_session DELETE|GET /admin/logout(.:format)                                                                                           {:action=>"destroy", :controller=>"active_admin/devise/sessions"}
#                                  admin_user_password POST       /admin/password(.:format)                                                                                         {:action=>"create", :controller=>"active_admin/devise/passwords"}
#                              new_admin_user_password GET        /admin/password/new(.:format)                                                                                     {:action=>"new", :controller=>"active_admin/devise/passwords"}
#                             edit_admin_user_password GET        /admin/password/edit(.:format)                                                                                    {:action=>"edit", :controller=>"active_admin/devise/passwords"}
#                                                      PUT        /admin/password(.:format)                                                                                         {:action=>"update", :controller=>"active_admin/devise/passwords"}
#                                     new_user_session GET        /d/users/sign_in(.:format)                                                                                        {:action=>"new", :controller=>"devise/sessions"}
#                                         user_session POST       /d/users/sign_in(.:format)                                                                                        {:action=>"create", :controller=>"devise/sessions"}
#                                 destroy_user_session DELETE     /d/users/sign_out(.:format)                                                                                       {:action=>"destroy", :controller=>"devise/sessions"}
#                                        user_password POST       /d/users/password(.:format)                                                                                       {:action=>"create", :controller=>"devise/passwords"}
#                                    new_user_password GET        /d/users/password/new(.:format)                                                                                   {:action=>"new", :controller=>"devise/passwords"}
#                                   edit_user_password GET        /d/users/password/edit(.:format)                                                                                  {:action=>"edit", :controller=>"devise/passwords"}
#                                                      PUT        /d/users/password(.:format)                                                                                       {:action=>"update", :controller=>"devise/passwords"}
#                             cancel_user_registration GET        /d/users/cancel(.:format)                                                                                         {:action=>"cancel", :controller=>"registrations"}
#                                    user_registration POST       /d/users(.:format)                                                                                                {:action=>"create", :controller=>"registrations"}
#                                new_user_registration GET        /d/users/sign_up(.:format)                                                                                        {:action=>"new", :controller=>"registrations"}
#                               edit_user_registration GET        /d/users/edit(.:format)                                                                                           {:action=>"edit", :controller=>"registrations"}
#                                                      PUT        /d/users(.:format)                                                                                                {:action=>"update", :controller=>"registrations"}
#                                                      DELETE     /d/users(.:format)                                                                                                {:action=>"destroy", :controller=>"registrations"}
#                                      authentications GET        /authentications(.:format)                                                                                        {:action=>"index", :controller=>"authentications"}
#                                                      POST       /authentications(.:format)                                                                                        {:action=>"create", :controller=>"authentications"}
#                                   new_authentication GET        /authentications/new(.:format)                                                                                    {:action=>"new", :controller=>"authentications"}
#                                  edit_authentication GET        /authentications/:id/edit(.:format)                                                                               {:action=>"edit", :controller=>"authentications"}
#                                       authentication GET        /authentications/:id(.:format)                                                                                    {:action=>"show", :controller=>"authentications"}
#                                                      PUT        /authentications/:id(.:format)                                                                                    {:action=>"update", :controller=>"authentications"}
#                                                      DELETE     /authentications/:id(.:format)                                                                                    {:action=>"destroy", :controller=>"authentications"}
#                                                   me            /me(.:format)                                                                                                     {:controller=>"me", :action=>"home"}
#                                              manager            /manager(.:format)                                                                                                {:controller=>"topics", :action=>"new"}
#                                                   hr            /hr(.:format)                                                                                                     {:controller=>"groupings", :action=>"new"}
#                                                admin            /admin(.:format)                                                                                                  {:controller=>"pages", :action=>"admin"}
#                                        company_admin            /company_admin(.:format)                                                                                          {:controller=>"users", :action=>"index"}
#                                             pages_me            /pages/me(.:format)                                                                                               {:controller=>"pages", :action=>"me"}
#                         topic_groups_import_elements            /topic_groups/import_elements(.:format)                                                                           {:controller=>"topic_groups", :action=>"import_elements"}
#                            topic_groups_assign_topic            /topic_groups/assign_topic(.:format)                                                                              {:controller=>"topic_groups", :action=>"assign_topic"}
#                                   topics_staff_topic            /topics/staff_topic(.:format)                                                                                     {:controller=>"topics", :action=>"staff_topic"}
#                                               topics POST       /topics(.:format)                                                                                                 {:controller=>"topics", :action=>"create"}
#                                           topics_new            /topics/new(.:format)                                                                                             {:controller=>"topics", :action=>"new"}
#                                                                 /topics(.:format)                                                                                                 {:controller=>"topics", :action=>"edit"}
#                                                      GET        /topics/:id(.:format)                                                                                             {:controller=>"topics", :action=>"edit"}
#                                            groupings POST       /groupings(.:format)                                                                                              {:controller=>"groupings", :action=>"create"}
#                                        groupings_new            /groupings/new(.:format)                                                                                          {:controller=>"groupings", :action=>"new"}
#                                                                 /groupings(.:format)                                                                                              {:controller=>"groupings", :action=>"edit"}
#                                                                 /groupings/:id/new_user(.:format)                                                                                 {:controller=>"groupings", :action=>"new_user"}
#                                                                 /groupings/:id/add_user(.:format)                                                                                 {:controller=>"groupings", :action=>"add_user"}
#                              groupings_import_groups            /groupings/import_groups(.:format)                                                                                {:controller=>"groupings", :action=>"import_groups"}
#                                         auth_failure            /auth/failure(.:format)                                                                                           {:controller=>"authentications", :action=>"auth_fail"}
#                                   users_import_users            /users/import_users(.:format)                                                                                     {:controller=>"users", :action=>"import_users"}
#                                  users_rate_elements            /users/rate_elements(.:format)                                                                                    {:controller=>"users", :action=>"rate_elements"}
#                           users_approve_new_elements            /users/approve_new_elements(.:format)                                                                             {:controller=>"users", :action=>"approve_new_elements"}
#                                                                 /me/event_list/:date(.:format)                                                                                    {:controller=>"me", :action=>"event_list"}
#                                            me_events            /me/events(.:format)                                                                                              {:controller=>"me", :action=>"events"}
#                                                      GET        /companies/:id(.:format)                                                                                          {:controller=>"companies", :action=>"edit"}
#                           libraries_import_libraries            /libraries/import_libraries(.:format)                                                                             {:controller=>"libraries", :action=>"import_libraries"}
#                          libraries_import_objectives            /libraries/import_objectives(.:format)                                                                            {:controller=>"libraries", :action=>"import_objectives"}
#                         topic_group_assign_libraries            /topic_groups/:topic_group_id/assign_libraries(.:format)                                                          {:action=>"assign_libraries", :controller=>"topics_groups"}
#                             topic_group_participants            /topic_groups/:topic_group_id/participants(.:format)                                                              {:action=>"participants", :controller=>"topic_groups"}
#                              topic_group_assignments GET        /topic_groups/:topic_group_id/assignments(.:format)                                                               {:action=>"index", :controller=>"assignments"}
#                                                      POST       /topic_groups/:topic_group_id/assignments(.:format)                                                               {:action=>"create", :controller=>"assignments"}
#                           new_topic_group_assignment GET        /topic_groups/:topic_group_id/assignments/new(.:format)                                                           {:action=>"new", :controller=>"assignments"}
#                          edit_topic_group_assignment GET        /topic_groups/:topic_group_id/assignments/:id/edit(.:format)                                                      {:action=>"edit", :controller=>"assignments"}
#                               topic_group_assignment GET        /topic_groups/:topic_group_id/assignments/:id(.:format)                                                           {:action=>"show", :controller=>"assignments"}
#                                                      PUT        /topic_groups/:topic_group_id/assignments/:id(.:format)                                                           {:action=>"update", :controller=>"assignments"}
#                                                      DELETE     /topic_groups/:topic_group_id/assignments/:id(.:format)                                                           {:action=>"destroy", :controller=>"assignments"}
#                                    topic_group_close POST       /topic_groups/:topic_group_id/close(.:format)                                                                     {:action=>"close", :controller=>"topic_groups"}
#                                   topic_group_export POST       /topic_groups/:topic_group_id/export(.:format)                                                                    {:action=>"export_elements", :controller=>"topic_groups"}
#                          topic_group_iteration_close POST       /topic_groups/:topic_group_id/iterations/:iteration_id/close(.:format)                                            {:action=>"close", :controller=>"iterations"}
#                          topic_group_iteration_start POST       /topic_groups/:topic_group_id/iterations/:iteration_id/start(.:format)                                            {:action=>"start", :controller=>"iterations"}
#                   topic_group_iteration_participants            /topic_groups/:topic_group_id/iterations/:iteration_id/participants(.:format)                                     {:action=>"participants", :controller=>"topic_groups"}
#            topic_group_iteration_element_description            /topic_groups/:topic_group_id/iterations/:iteration_id/elements/:element_id/description(.:format)                 {:action=>"description", :controller=>"elements"}
#     topic_group_iteration_element_element_attributes GET        /topic_groups/:topic_group_id/iterations/:iteration_id/elements/:element_id/element_attributes(.:format)          {:action=>"index", :controller=>"element_attributes"}
#                                                      POST       /topic_groups/:topic_group_id/iterations/:iteration_id/elements/:element_id/element_attributes(.:format)          {:action=>"create", :controller=>"element_attributes"}
#  new_topic_group_iteration_element_element_attribute GET        /topic_groups/:topic_group_id/iterations/:iteration_id/elements/:element_id/element_attributes/new(.:format)      {:action=>"new", :controller=>"element_attributes"}
# edit_topic_group_iteration_element_element_attribute GET        /topic_groups/:topic_group_id/iterations/:iteration_id/elements/:element_id/element_attributes/:id/edit(.:format) {:action=>"edit", :controller=>"element_attributes"}
#      topic_group_iteration_element_element_attribute GET        /topic_groups/:topic_group_id/iterations/:iteration_id/elements/:element_id/element_attributes/:id(.:format)      {:action=>"show", :controller=>"element_attributes"}
#                                                      PUT        /topic_groups/:topic_group_id/iterations/:iteration_id/elements/:element_id/element_attributes/:id(.:format)      {:action=>"update", :controller=>"element_attributes"}
#                                                      DELETE     /topic_groups/:topic_group_id/iterations/:iteration_id/elements/:element_id/element_attributes/:id(.:format)      {:action=>"destroy", :controller=>"element_attributes"}
#                       topic_group_iteration_elements GET        /topic_groups/:topic_group_id/iterations/:iteration_id/elements(.:format)                                         {:action=>"index", :controller=>"elements"}
#                                                      POST       /topic_groups/:topic_group_id/iterations/:iteration_id/elements(.:format)                                         {:action=>"create", :controller=>"elements"}
#                    new_topic_group_iteration_element GET        /topic_groups/:topic_group_id/iterations/:iteration_id/elements/new(.:format)                                     {:action=>"new", :controller=>"elements"}
#                   edit_topic_group_iteration_element GET        /topic_groups/:topic_group_id/iterations/:iteration_id/elements/:id/edit(.:format)                                {:action=>"edit", :controller=>"elements"}
#                        topic_group_iteration_element GET        /topic_groups/:topic_group_id/iterations/:iteration_id/elements/:id(.:format)                                     {:action=>"show", :controller=>"elements"}
#                                                      PUT        /topic_groups/:topic_group_id/iterations/:iteration_id/elements/:id(.:format)                                     {:action=>"update", :controller=>"elements"}
#                                                      DELETE     /topic_groups/:topic_group_id/iterations/:iteration_id/elements/:id(.:format)                                     {:action=>"destroy", :controller=>"elements"}
#                               topic_group_iterations GET        /topic_groups/:topic_group_id/iterations(.:format)                                                                {:action=>"index", :controller=>"iterations"}
#                                                      POST       /topic_groups/:topic_group_id/iterations(.:format)                                                                {:action=>"create", :controller=>"iterations"}
#                            new_topic_group_iteration GET        /topic_groups/:topic_group_id/iterations/new(.:format)                                                            {:action=>"new", :controller=>"iterations"}
#                           edit_topic_group_iteration GET        /topic_groups/:topic_group_id/iterations/:id/edit(.:format)                                                       {:action=>"edit", :controller=>"iterations"}
#                                topic_group_iteration GET        /topic_groups/:topic_group_id/iterations/:id(.:format)                                                            {:action=>"show", :controller=>"iterations"}
#                                                      PUT        /topic_groups/:topic_group_id/iterations/:id(.:format)                                                            {:action=>"update", :controller=>"iterations"}
#                                                      DELETE     /topic_groups/:topic_group_id/iterations/:id(.:format)                                                            {:action=>"destroy", :controller=>"iterations"}
#                                         topic_groups GET        /topic_groups(.:format)                                                                                           {:action=>"index", :controller=>"topic_groups"}
#                                                      POST       /topic_groups(.:format)                                                                                           {:action=>"create", :controller=>"topic_groups"}
#                                      new_topic_group GET        /topic_groups/new(.:format)                                                                                       {:action=>"new", :controller=>"topic_groups"}
#                                     edit_topic_group GET        /topic_groups/:id/edit(.:format)                                                                                  {:action=>"edit", :controller=>"topic_groups"}
#                                          topic_group GET        /topic_groups/:id(.:format)                                                                                       {:action=>"show", :controller=>"topic_groups"}
#                                                      PUT        /topic_groups/:id(.:format)                                                                                       {:action=>"update", :controller=>"topic_groups"}
#                                                      DELETE     /topic_groups/:id(.:format)                                                                                       {:action=>"destroy", :controller=>"topic_groups"}
#                               topic_assign_libraries            /topics/:topic_id/assign_libraries(.:format)                                                                      {:action=>"assign_libraries", :controller=>"topics"}
#                                   topic_topic_groups GET        /topics/:topic_id/topic_groups(.:format)                                                                          {:action=>"index", :controller=>"topic_groups"}
#                                                      POST       /topics/:topic_id/topic_groups(.:format)                                                                          {:action=>"create", :controller=>"topic_groups"}
#                                new_topic_topic_group GET        /topics/:topic_id/topic_groups/new(.:format)                                                                      {:action=>"new", :controller=>"topic_groups"}
#                               edit_topic_topic_group GET        /topics/:topic_id/topic_groups/:id/edit(.:format)                                                                 {:action=>"edit", :controller=>"topic_groups"}
#                                    topic_topic_group GET        /topics/:topic_id/topic_groups/:id(.:format)                                                                      {:action=>"show", :controller=>"topic_groups"}
#                                                      PUT        /topics/:topic_id/topic_groups/:id(.:format)                                                                      {:action=>"update", :controller=>"topic_groups"}
#                                                      DELETE     /topics/:topic_id/topic_groups/:id(.:format)                                                                      {:action=>"destroy", :controller=>"topic_groups"}
#        autocomplete_user_last_name_topic_assignments GET        /topics/:topic_id/assignments/autocomplete_user_last_name(.:format)                                               {:action=>"autocomplete_user_last_name", :controller=>"assignments"}
#                                    topic_assignments GET        /topics/:topic_id/assignments(.:format)                                                                           {:action=>"index", :controller=>"assignments"}
#                                                      POST       /topics/:topic_id/assignments(.:format)                                                                           {:action=>"create", :controller=>"assignments"}
#                                 new_topic_assignment GET        /topics/:topic_id/assignments/new(.:format)                                                                       {:action=>"new", :controller=>"assignments"}
#                                edit_topic_assignment GET        /topics/:topic_id/assignments/:id/edit(.:format)                                                                  {:action=>"edit", :controller=>"assignments"}
#                                     topic_assignment GET        /topics/:topic_id/assignments/:id(.:format)                                                                       {:action=>"show", :controller=>"assignments"}
#                                                      PUT        /topics/:topic_id/assignments/:id(.:format)                                                                       {:action=>"update", :controller=>"assignments"}
#                                                      DELETE     /topics/:topic_id/assignments/:id(.:format)                                                                       {:action=>"destroy", :controller=>"assignments"}
#                                                      GET        /topics(.:format)                                                                                                 {:action=>"index", :controller=>"topics"}
#                                                      POST       /topics(.:format)                                                                                                 {:action=>"create", :controller=>"topics"}
#                                            new_topic GET        /topics/new(.:format)                                                                                             {:action=>"new", :controller=>"topics"}
#                                           edit_topic GET        /topics/:id/edit(.:format)                                                                                        {:action=>"edit", :controller=>"topics"}
#                                                topic GET        /topics/:id(.:format)                                                                                             {:action=>"show", :controller=>"topics"}
#                                                      PUT        /topics/:id(.:format)                                                                                             {:action=>"update", :controller=>"topics"}
#                                                      DELETE     /topics/:id(.:format)                                                                                             {:action=>"destroy", :controller=>"topics"}
#                autocomplete_user_last_name_groupings GET        /groupings/autocomplete_user_last_name(.:format)                                                                  {:action=>"autocomplete_user_last_name", :controller=>"groupings"}
#                                 grouping_user_remove POST       /groupings/:grouping_id/users/:user_id/remove(.:format)                                                           {:action=>"remove", :controller=>"groupings"}
#                                       grouping_users GET        /groupings/:grouping_id/users(.:format)                                                                           {:action=>"index", :controller=>"users"}
#                                                      POST       /groupings/:grouping_id/users(.:format)                                                                           {:action=>"create", :controller=>"users"}
#                                    new_grouping_user GET        /groupings/:grouping_id/users/new(.:format)                                                                       {:action=>"new", :controller=>"users"}
#                                   edit_grouping_user GET        /groupings/:grouping_id/users/:id/edit(.:format)                                                                  {:action=>"edit", :controller=>"users"}
#                                        grouping_user GET        /groupings/:grouping_id/users/:id(.:format)                                                                       {:action=>"show", :controller=>"users"}
#                                                      PUT        /groupings/:grouping_id/users/:id(.:format)                                                                       {:action=>"update", :controller=>"users"}
#                                                      DELETE     /groupings/:grouping_id/users/:id(.:format)                                                                       {:action=>"destroy", :controller=>"users"}
#                                                      GET        /groupings(.:format)                                                                                              {:action=>"index", :controller=>"groupings"}
#                                                      POST       /groupings(.:format)                                                                                              {:action=>"create", :controller=>"groupings"}
#                                         new_grouping GET        /groupings/new(.:format)                                                                                          {:action=>"new", :controller=>"groupings"}
#                                        edit_grouping GET        /groupings/:id/edit(.:format)                                                                                     {:action=>"edit", :controller=>"groupings"}
#                                             grouping GET        /groupings/:id(.:format)                                                                                          {:action=>"show", :controller=>"groupings"}
#                                                      PUT        /groupings/:id(.:format)                                                                                          {:action=>"update", :controller=>"groupings"}
#                                                      DELETE     /groupings/:id(.:format)                                                                                          {:action=>"destroy", :controller=>"groupings"}
#                      autocomplete_company_name_users GET        /users/autocomplete_company_name(.:format)                                                                        {:action=>"autocomplete_company_name", :controller=>"users"}
#                                                users GET        /users(.:format)                                                                                                  {:action=>"index", :controller=>"users"}
#                                                      POST       /users(.:format)                                                                                                  {:action=>"create", :controller=>"users"}
#                                             new_user GET        /users/new(.:format)                                                                                              {:action=>"new", :controller=>"users"}
#                                            edit_user GET        /users/:id/edit(.:format)                                                                                         {:action=>"edit", :controller=>"users"}
#                                                 user GET        /users/:id(.:format)                                                                                              {:action=>"show", :controller=>"users"}
#                                                      PUT        /users/:id(.:format)                                                                                              {:action=>"update", :controller=>"users"}
#                                                      DELETE     /users/:id(.:format)                                                                                              {:action=>"destroy", :controller=>"users"}
#                                  element_description            /elements/:element_id/description(.:format)                                                                       {:action=>"description", :controller=>"elements"}
#                                             elements GET        /elements(.:format)                                                                                               {:action=>"index", :controller=>"elements"}
#                                                      POST       /elements(.:format)                                                                                               {:action=>"create", :controller=>"elements"}
#                                          new_element GET        /elements/new(.:format)                                                                                           {:action=>"new", :controller=>"elements"}
#                                         edit_element GET        /elements/:id/edit(.:format)                                                                                      {:action=>"edit", :controller=>"elements"}
#                                              element GET        /elements/:id(.:format)                                                                                           {:action=>"show", :controller=>"elements"}
#                                                      PUT        /elements/:id(.:format)                                                                                           {:action=>"update", :controller=>"elements"}
#                                                      DELETE     /elements/:id(.:format)                                                                                           {:action=>"destroy", :controller=>"elements"}
#                                   element_attributes GET        /element_attributes(.:format)                                                                                     {:action=>"index", :controller=>"element_attributes"}
#                                                      POST       /element_attributes(.:format)                                                                                     {:action=>"create", :controller=>"element_attributes"}
#                                new_element_attribute GET        /element_attributes/new(.:format)                                                                                 {:action=>"new", :controller=>"element_attributes"}
#                               edit_element_attribute GET        /element_attributes/:id/edit(.:format)                                                                            {:action=>"edit", :controller=>"element_attributes"}
#                                    element_attribute GET        /element_attributes/:id(.:format)                                                                                 {:action=>"show", :controller=>"element_attributes"}
#                                                      PUT        /element_attributes/:id(.:format)                                                                                 {:action=>"update", :controller=>"element_attributes"}
#                                                      DELETE     /element_attributes/:id(.:format)                                                                                 {:action=>"destroy", :controller=>"element_attributes"}
#                 autocomplete_company_name_ajax_index GET        /ajax/autocomplete_company_name(.:format)                                                                         {:action=>"autocomplete_company_name", :controller=>"ajax"}
#                                           ajax_index GET        /ajax(.:format)                                                                                                   {:action=>"index", :controller=>"ajax"}
#                                                      POST       /ajax(.:format)                                                                                                   {:action=>"create", :controller=>"ajax"}
#                                             new_ajax GET        /ajax/new(.:format)                                                                                               {:action=>"new", :controller=>"ajax"}
#                                            edit_ajax GET        /ajax/:id/edit(.:format)                                                                                          {:action=>"edit", :controller=>"ajax"}
#                                                 ajax GET        /ajax/:id(.:format)                                                                                               {:action=>"show", :controller=>"ajax"}
#                                                      PUT        /ajax/:id(.:format)                                                                                               {:action=>"update", :controller=>"ajax"}
#                                                      DELETE     /ajax/:id(.:format)                                                                                               {:action=>"destroy", :controller=>"ajax"}
#                           library_library_objectives GET        /libraries/:library_id/library_objectives(.:format)                                                               {:action=>"index", :controller=>"library_objectives"}
#                                                      POST       /libraries/:library_id/library_objectives(.:format)                                                               {:action=>"create", :controller=>"library_objectives"}
#                        new_library_library_objective GET        /libraries/:library_id/library_objectives/new(.:format)                                                           {:action=>"new", :controller=>"library_objectives"}
#                       edit_library_library_objective GET        /libraries/:library_id/library_objectives/:id/edit(.:format)                                                      {:action=>"edit", :controller=>"library_objectives"}
#                            library_library_objective GET        /libraries/:library_id/library_objectives/:id(.:format)                                                           {:action=>"show", :controller=>"library_objectives"}
#                                                      PUT        /libraries/:library_id/library_objectives/:id(.:format)                                                           {:action=>"update", :controller=>"library_objectives"}
#                                                      DELETE     /libraries/:library_id/library_objectives/:id(.:format)                                                           {:action=>"destroy", :controller=>"library_objectives"}
#                                            libraries GET        /libraries(.:format)                                                                                              {:action=>"index", :controller=>"libraries"}
#                                                      POST       /libraries(.:format)                                                                                              {:action=>"create", :controller=>"libraries"}
#                                          new_library GET        /libraries/new(.:format)                                                                                          {:action=>"new", :controller=>"libraries"}
#                                         edit_library GET        /libraries/:id/edit(.:format)                                                                                     {:action=>"edit", :controller=>"libraries"}
#                                              library GET        /libraries/:id(.:format)                                                                                          {:action=>"show", :controller=>"libraries"}
#                                                      PUT        /libraries/:id(.:format)                                                                                          {:action=>"update", :controller=>"libraries"}
#                                                      DELETE     /libraries/:id(.:format)                                                                                          {:action=>"destroy", :controller=>"libraries"}
#                                        ldap_settings GET        /ldap_settings(.:format)                                                                                          {:action=>"index", :controller=>"ldap_settings"}
#                                                      POST       /ldap_settings(.:format)                                                                                          {:action=>"create", :controller=>"ldap_settings"}
#                                     new_ldap_setting GET        /ldap_settings/new(.:format)                                                                                      {:action=>"new", :controller=>"ldap_settings"}
#                                    edit_ldap_setting GET        /ldap_settings/:id/edit(.:format)                                                                                 {:action=>"edit", :controller=>"ldap_settings"}
#                                         ldap_setting GET        /ldap_settings/:id(.:format)                                                                                      {:action=>"show", :controller=>"ldap_settings"}
#                                                      PUT        /ldap_settings/:id(.:format)                                                                                      {:action=>"update", :controller=>"ldap_settings"}
#                                                      DELETE     /ldap_settings/:id(.:format)                                                                                      {:action=>"destroy", :controller=>"ldap_settings"}
#                                            companies GET        /companies(.:format)                                                                                              {:action=>"index", :controller=>"companies"}
#                                                      POST       /companies(.:format)                                                                                              {:action=>"create", :controller=>"companies"}
#                                          new_company GET        /companies/new(.:format)                                                                                          {:action=>"new", :controller=>"companies"}
#                                         edit_company GET        /companies/:id/edit(.:format)                                                                                     {:action=>"edit", :controller=>"companies"}
#                                              company GET        /companies/:id(.:format)                                                                                          {:action=>"show", :controller=>"companies"}
#                                                      PUT        /companies/:id(.:format)                                                                                          {:action=>"update", :controller=>"companies"}
#                                                      DELETE     /companies/:id(.:format)                                                                                          {:action=>"destroy", :controller=>"companies"}
#                                          assignments GET        /assignments(.:format)                                                                                            {:action=>"index", :controller=>"assignments"}
#                                                      POST       /assignments(.:format)                                                                                            {:action=>"create", :controller=>"assignments"}
#                                       new_assignment GET        /assignments/new(.:format)                                                                                        {:action=>"new", :controller=>"assignments"}
#                                      edit_assignment GET        /assignments/:id/edit(.:format)                                                                                   {:action=>"edit", :controller=>"assignments"}
#                                           assignment GET        /assignments/:id(.:format)                                                                                        {:action=>"show", :controller=>"assignments"}
#                                                      PUT        /assignments/:id(.:format)                                                                                        {:action=>"update", :controller=>"assignments"}
#                                                      DELETE     /assignments/:id(.:format)                                                                                        {:action=>"destroy", :controller=>"assignments"}
#                                                 root            /(.:format)                                                                                                       {:controller=>"me", :action=>"home"}
