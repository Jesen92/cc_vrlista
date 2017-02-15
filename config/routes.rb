Rails.application.routes.draw do


  get 'jobs/index'
  get 'jobs/show'
  get 'jobs/new'
  get 'jobs/create'
  get 'jobs/edit'
  get 'jobs/update'
  get 'jobs/destroy'
  get 'projects/index'
  get 'projects/show'
  get 'projects/new'
  get 'projects/create'
  get 'projects/edit'
  get 'projects/update'
  get 'projects/destroy'
  get 'companies/index'
  get 'companies/show'
  get 'companies/new'
  get 'companies/create'
  get 'companies/edit'
  get 'companies/update'
  get 'companies/destroy'
  get 'home/index'
  get 'home/show'

  root :to => "jobs#index"

  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations', confirmations: 'users/confirmations'}

  devise_scope :user do
    get "login", to: "users/sessions#new"
    authenticated :user do
      root :to => 'jobs#index', as: :authenticated_root
      get "sign_uo", to: "devise/registrastions#new"
      #match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]
    end
    unauthenticated :user do
      root :to => 'users/sessions#new', as: :unauthenticated_root
    end

  resources :companies
  resources :projects
  resources :jobs

  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
  #
  #
  #     collection do
  #       get 'sold'
  #
  #

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #
  #

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable





  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #
end
