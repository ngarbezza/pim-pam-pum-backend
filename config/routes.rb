Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    resource :sessions, only: [:create, :destroy]
    resources :eventos do
      member do
        get :confirmados
      end
    end
    resources :users, only: [:create]
    resources :invitados, only: [:index]
    resources :invitaciones, only: [:index] do
      collection do
        post :invitar
      end
      member do
        put :aceptar
        put :rechazar
      end
    end
    get 'clima', to: 'clima#show'
  end

  match '/*path', to: proc {
    [
        204,
        {
            'Content-Type' => 'text/plain',
            'Access-Control-Allow-Origin' => CORS_ALLOW_ORIGIN,
            'Access-Control-Allow-Methods' => CORS_ALLOW_METHODS,
            'Access-Control-Allow-Headers' => CORS_ALLOW_HEADERS
        },
        []
    ]
  }, via: [:options, :head]

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
