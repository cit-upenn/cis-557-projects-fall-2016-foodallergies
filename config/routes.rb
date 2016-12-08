# == Route Map
#
#                   Prefix Verb     URI Pattern                            Controller#Action
#         static_page_home GET      /static_page/home(.:format)            static_page#home
#                     root GET      /                                      static_page#home
#             foods_search GET      /search_food(.:format)                 foods#search
#         static_page_help GET      /static_page/help(.:format)            static_page#help
#         new_user_session GET      /users/sign_in(.:format)               users/sessions#new
#             user_session POST     /users/sign_in(.:format)               users/sessions#create
#     destroy_user_session DELETE   /users/sign_out(.:format)              users/sessions#destroy
#            user_password POST     /users/password(.:format)              devise/passwords#create
#        new_user_password GET      /users/password/new(.:format)          devise/passwords#new
#       edit_user_password GET      /users/password/edit(.:format)         devise/passwords#edit
#                          PATCH    /users/password(.:format)              devise/passwords#update
#                          PUT      /users/password(.:format)              devise/passwords#update
# cancel_user_registration GET      /users/cancel(.:format)                devise/registrations#cancel
#        user_registration POST     /users(.:format)                       devise/registrations#create
#    new_user_registration GET      /users/sign_up(.:format)               devise/registrations#new
#   edit_user_registration GET      /users/edit(.:format)                  devise/registrations#edit
#                          PATCH    /users(.:format)                       devise/registrations#update
#                          PUT      /users(.:format)                       devise/registrations#update
#                          DELETE   /users(.:format)                       devise/registrations#destroy
#  user_omniauth_authorize GET|POST /users/auth/:provider(.:format)        users/omniauth_callbacks#passthru {:provider=>/facebook/}
#   user_omniauth_callback GET|POST /users/auth/:action/callback(.:format) users/omniauth_callbacks#(?-mix:facebook)
#                     user GET      /users/:id(.:format)                   users#show
#            settings_user GET      /users/:id/settings(.:format)          users#settings
#                    users GET      /users(.:format)                       users#index
#                          POST     /users(.:format)                       users#create
#                 new_user GET      /users/new(.:format)                   users#new
#                edit_user GET      /users/:id/edit(.:format)              users#edit
#                          GET      /users/:id(.:format)                   users#show
#                          PATCH    /users/:id(.:format)                   users#update
#                          PUT      /users/:id(.:format)                   users#update
#                          DELETE   /users/:id(.:format)                   users#destroy
#              ingredients GET      /ingredients(.:format)                 ingredients#index
#                          POST     /ingredients(.:format)                 ingredients#create
#           new_ingredient GET      /ingredients/new(.:format)             ingredients#new
#          edit_ingredient GET      /ingredients/:id/edit(.:format)        ingredients#edit
#               ingredient GET      /ingredients/:id(.:format)             ingredients#show
#                          PATCH    /ingredients/:id(.:format)             ingredients#update
#                          PUT      /ingredients/:id(.:format)             ingredients#update
#                          DELETE   /ingredients/:id(.:format)             ingredients#destroy
#                  weights GET      /weights(.:format)                     weights#index
#                          POST     /weights(.:format)                     weights#create
#               new_weight GET      /weights/new(.:format)                 weights#new
#              edit_weight GET      /weights/:id/edit(.:format)            weights#edit
#                   weight GET      /weights/:id(.:format)                 weights#show
#                          PATCH    /weights/:id(.:format)                 weights#update
#                          PUT      /weights/:id(.:format)                 weights#update
#                          DELETE   /weights/:id(.:format)                 weights#destroy
#                allergens GET      /allergens(.:format)                   allergens#index
#                          POST     /allergens(.:format)                   allergens#create
#             new_allergen GET      /allergens/new(.:format)               allergens#new
#            edit_allergen GET      /allergens/:id/edit(.:format)          allergens#edit
#                 allergen GET      /allergens/:id(.:format)               allergens#show
#                    foods GET      /foods(.:format)                       foods#index
#                          POST     /foods(.:format)                       foods#create
#                 new_food GET      /foods/new(.:format)                   foods#new
#                edit_food GET      /foods/:id/edit(.:format)              foods#edit
#                     food GET      /foods/:id(.:format)                   foods#show
#                          PATCH    /foods/:id(.:format)                   foods#update
#                          PUT      /foods/:id(.:format)                   foods#update
#                          DELETE   /foods/:id(.:format)                   foods#destroy
#                          GET      /diary_entries/sort/:field(.:format)   diary_entries#sort
#            diary_entries GET      /diary_entries(.:format)               diary_entries#index
#                          POST     /diary_entries(.:format)               diary_entries#create
#          new_diary_entry GET      /diary_entries/new(.:format)           diary_entries#new
#         edit_diary_entry GET      /diary_entries/:id/edit(.:format)      diary_entries#edit
#              diary_entry GET      /diary_entries/:id(.:format)           diary_entries#show
#                          PATCH    /diary_entries/:id(.:format)           diary_entries#update
#                          PUT      /diary_entries/:id(.:format)           diary_entries#update
#                          DELETE   /diary_entries/:id(.:format)           diary_entries#destroy
#

Rails.application.routes.draw do

  get 'static_page/home'
  get 'static_page/help'

  root 'static_page#home'

  match 'search_food', to: 'foods#search', via: :get, as: :foods_search

  devise_for :users, :controllers => { sessions: 'users/sessions', :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users do
    member do
      get 'settings'
    end
  end

  resources :ingredients

  resources :weights

  resources :allergens, except: [:destroy, :update]

  resources :foods

  resources :diary_entries do
    collection do
      get 'sort/:field' => 'diary_entries#sort'
    end
  end

  post 'diary_entries/download'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
