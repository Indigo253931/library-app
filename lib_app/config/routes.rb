Rails.application.routes.draw do
   root to: "users#index"

  get "/users", to: "users#index", as: "users"

  get "/users/new", to: "users#new", as: "new_user"

  post "/users", to: "users#create"

  get "/users/:id", to: "users#show"
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
