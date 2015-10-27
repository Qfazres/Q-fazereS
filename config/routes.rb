Rails.application.routes.draw do
  devise_for :users

  resources :users do
    get "favoritos", to: "favoritos#favoritos"
    resources :lists do
      post "favorito", to: "favoritos#add_favorito"
      resources :favoritos, only: [:favoritos, :favorito, :delete] do
        delete "delete", to: "favoritos#remove_favorito"
      end
      resources :items, only: [:destroy] do
        patch "complete", to: "items#complete"
        patch "uncomplete", to: "items#uncomplete"
        resources :sub_items, only: [:destroy] do
          patch "complete", to: "sub_items#complete"
          patch "uncomplete", to: "sub_items#uncomplete"
        end
      end
    end
  end

  get "publica", to: "home#publica"

  root to: "home#index"
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
