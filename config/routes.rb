Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  root "home#index"
  get "/home", to: "home/index"
  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post "/users" => "users#create"
    patch "/users/:id" => "users#update"
    post "/sessions" => "sessions#create"

    get "/shifts" => "shifts#index"
    post "/shifts" => "shifts#create"
    patch "/shifts/:id" => "shifts#update"
    delete "/shifts/:id" => "shifts#delete"

    get "/organisations" => "organisations#index"
    post "/organisations" => "organisations#create"
    patch "/organisations/:id" => "organisations#update"
    delete "/organisations/:id" => "organisations#delete"
  end
end
