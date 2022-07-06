Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post "/users" => "users#create"
    patch "/users_update/:id" => "users#update"
    patch "/users/:id" => "users#edit"

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
