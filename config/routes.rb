Imagine::Application.routes.draw do
  root :to => "problems#index"

  resources :problems do
    post :idea_preview, :to => "ideas#preview"
    put :idea_preview, :to => "ideas#preview"
    member do
      get :updates, defaults: { section: "updates" }, as: :updates, to: "problems#show"
    end
    resources :ideas do
      resource :votes, only: [:create] do
        get :create_from_session, :to => "votes#create"
      end
      resource :contributions, only: [:create] do
        get :create_from_session, :to => "contributions#create"
      end
    end
    resources :updates, only: [:show, :new, :create]
  end

  resources :users, only: [:show] do
    resources :contributions, only: [:create]
    get :pending_contributions, to: "contributions#pending_contributions"
  end

  resources :contributions, only: [] do
    post :accept, :to => "contributions#accept"
    put :reject, :to => "contributions#reject"
  end

  match "about" => "pages#about", as: "about"

  match "auth/facebook/callback" => "sessions#create"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
