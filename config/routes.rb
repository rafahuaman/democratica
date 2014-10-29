Rails.application.routes.draw do
  
  get 'tweets/new'

  get 'tweets/create'

  resources :rallies
  resources :congress_members
  resources :senators, :controller => "congress_members", :type => "Senator"
  resources :representatives, :controller => "congress_members", :type => "Representative"
  resources :identities

  get '/auth/:provider/callback', to: 'identities#create'
  #match '/auth/:provider/callback', to: 'identities#create'
  #match '/auth/failure', :to => 'identities#failure', via: 'get'

  resources :sessions, only: [:index]
  match '/find_congressional_district', to: 'find_congressional_district#index', via: 'get'

  resources :users do
    resources :after_signup, controller: 'after_signup'
  end
  
  
  resources :sessions, only: [:new, :create, :destroy]

  get 'static_pages/about'
  root 'rallies#index'

  match '/signup', to: 'users#new', via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

  match '/about', to: 'static_pages#about', via: 'get'

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
