Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  root "home#index"
  get "/home", to: "home#index"

  get "/login", to: "sessions#new"
  post "/login" => "sessions#create"

  get "/users/:id", to: "users#show", as: "users"
  get "/users/new", to: "users#new"
  post "/users" => "users#create"
  patch "/users_update/:id" => "users#update"
  patch "/organisations/:organisation_id/users/:id", to: "users#edit", as: "join_org"

  get "/organisations", to: "organisations#index"
  post "/organisations" => "organisations#create"
  patch "/organisations/:id" => "organisations#update"
  delete "/organisations/:id" => "organisations#delete"

  get "/shifts", to: "shifts#index", as: "shifts"
  post "/shifts" => "shifts#create"
  patch "/shifts/:id" => "shifts#update"
  delete "/shifts/:id" => "shifts#delete"
end
