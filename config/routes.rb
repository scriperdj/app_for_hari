Rails.application.routes.draw do

  match 'ajoke/clients' => 'clients#index', via: [:get]

  match 'ajoke/clients/create' => 'clients#create', via: [:post]

  match 'ajoke/clients/edit' => 'clients#edit', via: [:get]
  patch 'ajoke/clients/update' => 'clients#update'
  match 'ajoke/clients/update_client' => 'clients#update_client', via: [:post]
  match 'ajoke/clients/delete' => 'clients#delete', via: [:get]

  get 'images/upload_images'

  get 'ajoke/options'

  get 'ajoke/galleries'

  #get 'ajoke/clients'

  get 'ajoke/schedule'

  get 'ajoke/notifications'

  get 'ajoke/profile'

  match '/ajoke/create_gallery' => 'ajoke#create_gallery', via: [:post]
  match '/ajoke/upload_images' => 'ajoke#upload_images', via: [:get]
  match '/ajoke/add_photos' => 'ajoke#add_photos', via: [:get]
  match '/ajoke/uploaded_images' => 'ajoke#uploaded_images', via: [:get]
  match '/ajoke/update_cov' => 'ajoke#update_cov', via: [:post]
  match '/ajoke/save_images', :to => 'ajoke#save_images', :via => [:post, :put]
  match '/ajoke/upload_home' => 'ajoke#upload_home_images', via: [:get]
  match '/ajoke/delete_image' => 'ajoke#delete_image', via: [:post]

  devise_for :users


  devise_scope :user do
    match '/users/sign_out' => 'devise/sessions#destroy', via: [:get, :delete]
  end

  #get 'pages/home'

  #get 'pages/packages'

  #get 'pages/about'

  #get 'pages/contact'

  #get 'pages/ajoke'

  match '/about', :to => 'pages#about', :via => [:get]
  match '/gallery', :to => 'pages#gallery', :via => [:get]
  match '/galleries', :to => 'pages#galleries', :via => [:get]
  match '/view_gallery', :to => 'pages#view_gallery', :via => [:get]
  match '/packages', :to => 'pages#packages', :via => [:get]
  match '/contact', :to => 'pages#contact', :via => [:get, :post]
  match '/album_request', :to => 'pages#album_request', :via => [:get, :post]
  match '/ajoke', :to => 'ajoke#galleries', :via => [:get]
  match '/ajoke/save_cover', :to => 'ajoke#save_cover', :via => [:post, :put]


  root :to => 'pages#home'


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
