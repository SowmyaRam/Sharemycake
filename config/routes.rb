Sharemycake::Application.routes.draw do
  get "host_invitee/home"
  get "host_invitee/index"
  get "organizations/index"
  get "event/index"
  get "sessions/new"
  post "sessions/create"
  get "sessions/destroy"
  
  controller :sessions do
    get 'login' => :new
    post 'login' => :create 
    delete 'logout' => :destroy
  end

  resources :sessions
  resources :members
  
  resources :events do
    collection do
      # Update the selected organization to the event for the logged in member.
      get '/orgn_edit/:id', to: 'events#orgn_edit', as: 'orgn_edit'
      put '/orgn_edit/:id', to: 'events#orgn_update'
      get '/orgn_percent/:id', to: 'events#orgn_percent', as: 'orgn_percent'
      put '/orgn_percent/:id', to: 'events#orgn_percent_update'
      get '/orgn_template/:id', to: 'events#orgn_template', as: 'orgn_template'
      put '/orgn_template/:id', to: 'events#orgn_template_update'
      get '/event_invite/:id', to: 'events#event_invite', as: 'event_invite'
      put '/event_invite/:id', to: 'events#event_invite_update'
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

   get 'home/index'

  resources :about

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  root 'home#index'

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
