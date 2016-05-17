Rails.application.routes.draw do

  resources :sku_mappings
  resources :sku_patterns

  resources :imports, :only => [:index, :show, :new, :create]

  resources :states

  resources :mws_messages, :only => [:show]

  resources :stores do
    post 'sync', :on => :member
    post 'queue', :on => :member
  end

  resources :vendors do
  	get 'by_name', :on => :collection
  end
  resources :brands do
  	get 'by_name', :on => :collection
  end
  resources :products do
  	get 'by_sku_and_brand_id', :on => :collection
  end

  resources :listings # TODO only index?

  resources :variants, :variant_images do
  	get 'by_sku', :on => :collection
  end

  resources :sub_variants do
  	get 'by_sku', :on => :collection
  end

  #resources :products_stores, :only => [:create, :destroy]

  resources :mws_requests, :only => [:show, :index]
  resources :mws_orders do #, :only => [:show, :index, :update] do
  	collection do
  		get "export_to_csv"
  	end
  end
  resources :mws_order_items, :only => [:show]
  resources :analytics, :only => [:index]

  #match 'welcome'            => 'home#welcome'
  #match 'design'             => 'home#design'
  #match 'login'              => 'login#index',        :as => :login
  #match 'login/authenticate' => 'login#authenticate', :as => :authenticate
  #match 'login/finalize'     => 'login#finalize',     :as => :finalize
  #match 'login/logout'       => 'login#logout',       :as => :logout
  root :to                   => 'home#index'



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
