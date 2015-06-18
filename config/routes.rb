Rails.application.routes.draw do
  
use_doorkeeper
devise_for :users, :controllers => { registrations: 'users/registrations' }
#devise_for :admins, :controllers => { :sessions => "admins/sessions" }
resources :wedding_guests
resources :galleries 
resources :pictures


devise_scope :user do
  get 'register', to: 'users/registrations#new', as: :register
  get 'register_wedding', to: 'users/registrations#new', as: :register_wedding
  get '/login', to: 'users/sessions#new', as: :login
  get '/logout', to: 'users/sessions#destroy', as: :logout
  resources :wedding_guests
end

authenticated :user, lambda {|u| u.admin == true} do
  root to: "weddings#index", as: :user_root
  get 'weddings/search_results', to: 'weddings#search_results'
  get 'weddings/add_wedding', to: 'weddings#add_wedding'
  resources :wedding_guests

  resources :weddings do
  resources :pins do
    member do
      put "like", to: "pins#upvote"
    end
  end 
    resources :venues 
  end

end

authenticated :user, lambda {|u| u.admin == false} do
  root to: "weddings#index", as: :user_visitor
  get 'weddings/search_results', to: 'weddings#search_results'
  get 'weddings', to: 'weddings#index'
  resources :weddings, only: [:show, :search_results] do
    resources :pins do
    member do
      put "like", to: "pins#upvote"
    end
end 
  resources :venues 
end
end

  
root to: 'welcome#index'
resources :welcome





#devise_scope :admin do
#  get 'register', to: 'admins/registrations#new', as: :register
#  get '/login', to: 'admins/sessions#new', as: :login
#  get '/logout', to: 'admins/sessions#destroy', as: :logout
#end

namespace :api do
namespace :v1 do
  get 'items/create'
  end
end





namespace :api do
    namespace :v1 do
    resources :weddings
  end
end





  



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
