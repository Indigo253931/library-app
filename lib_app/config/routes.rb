Rails.application.routes.draw do
   root to: "users#index"
   
  get "/users", to: "users#index", as: "users"

  get "/users/new", to: "users#new", as: "new_user"

  post "/users", to: "users#create"

  get "/users/:id", to: "users#show"

  get "/sign_in", to: "sessions#new"

  post "/sessions", to: "sessions#create"

  get "/libraries", to: "libraries#index", as: "libraries"

  get "/libraries/new", to: "libraries#new", as: "new_library"

  get "/users/:user_id/libraries", to: "library_users#index", as: "user_libraries"
  
  post "/libraries/:library_id/users", to: "library_users#create", as: "library_users"

  post "/libraries", to: "libraries#create"	
	
  get "/libraries/:id/edit", to: "libraries#edit", as: "edit_library"

  get "/libraries/:id", to: "libraries#show", as:  "library"

  put "/libraries/:id", to: "libraries#update", as: "update_library"

  delete "/libraries/:id", to: "libraries#destroy", as: "destroy_library"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end