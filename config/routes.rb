# == Route Map
#
#                   Prefix Verb   URI Pattern                       Controller#Action
#                  weights GET    /weights(.:format)                weights#index
#                          POST   /weights(.:format)                weights#create
#               new_weight GET    /weights/new(.:format)            weights#new
#              edit_weight GET    /weights/:id/edit(.:format)       weights#edit
#                   weight GET    /weights/:id(.:format)            weights#show
#                          PATCH  /weights/:id(.:format)            weights#update
#                          PUT    /weights/:id(.:format)            weights#update
#                          DELETE /weights/:id(.:format)            weights#destroy
#                     root GET    /                                 static_page#home
#         new_user_session GET    /users/sign_in(.:format)          users/sessions#new
#             user_session POST   /users/sign_in(.:format)          users/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)         users/sessions#destroy
#            user_password POST   /users/password(.:format)         devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)     devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)    devise/passwords#edit
#                          PATCH  /users/password(.:format)         devise/passwords#update
#                          PUT    /users/password(.:format)         devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)           devise/registrations#cancel
#        user_registration POST   /users(.:format)                  devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)          devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)             devise/registrations#edit
#                          PATCH  /users(.:format)                  devise/registrations#update
#                          PUT    /users(.:format)                  devise/registrations#update
#                          DELETE /users(.:format)                  devise/registrations#destroy
#         static_page_home GET    /static_page/home(.:format)       static_page#home
#         static_page_help GET    /static_page/help(.:format)       static_page#help
#                allergens GET    /allergens(.:format)              allergens#index
#                          POST   /allergens(.:format)              allergens#create
#             new_allergen GET    /allergens/new(.:format)          allergens#new
#            edit_allergen GET    /allergens/:id/edit(.:format)     allergens#edit
#                 allergen GET    /allergens/:id(.:format)          allergens#show
#                          PATCH  /allergens/:id(.:format)          allergens#update
#                          PUT    /allergens/:id(.:format)          allergens#update
#                          DELETE /allergens/:id(.:format)          allergens#destroy
#                    foods GET    /foods(.:format)                  foods#index
#                          POST   /foods(.:format)                  foods#create
#                 new_food GET    /foods/new(.:format)              foods#new
#                edit_food GET    /foods/:id/edit(.:format)         foods#edit
#                     food GET    /foods/:id(.:format)              foods#show
#                          PATCH  /foods/:id(.:format)              foods#update
#                          PUT    /foods/:id(.:format)              foods#update
#                          DELETE /foods/:id(.:format)              foods#destroy
#            diary_entries GET    /diary_entries(.:format)          diary_entries#index
#                          POST   /diary_entries(.:format)          diary_entries#create
#          new_diary_entry GET    /diary_entries/new(.:format)      diary_entries#new
#         edit_diary_entry GET    /diary_entries/:id/edit(.:format) diary_entries#edit
#              diary_entry GET    /diary_entries/:id(.:format)      diary_entries#show
#                          PATCH  /diary_entries/:id(.:format)      diary_entries#update
#                          PUT    /diary_entries/:id(.:format)      diary_entries#update
#                          DELETE /diary_entries/:id(.:format)      diary_entries#destroy
#

Rails.application.routes.draw do

  root 'static_page#home'
  
  resources :ingredients

  resources :weights

  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }


  get 'static_page/home'

  get 'static_page/help'

  resources :allergens
  resources :foods
  resources :diary_entries

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
